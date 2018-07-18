//
//  ProtectionShieldViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import CoreLocation

class ProtectionShieldViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var lbl_location: UILabel!
    @IBOutlet weak var table_shield: UITableView!
    
    // MARK: - Properties
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    var sections: Array<OrganizationType> = []
    var expandedSections : NSMutableSet = []
    var mainDelegate: MainProtocol?
    var isDownload = false
    var parentView: UIView?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        self.table_shield.delegate = self
        self.table_shield.dataSource = self
        
        // For use when the app is open & in the background
        //locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func sectionTapped(_ sender: UIButton) {
        let section = sender.tag
        let shouldExpand = !expandedSections.contains(section)
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
            
        } else {
            expandedSections.removeAllObjects()
        }
        self.table_shield.reloadData()
        viewDidLayoutSubviews()
    }
    
    // Reverse geocoder
    func fetchCountryAndCity(location: CLLocation, completion: @escaping (String, String) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print(error)
            } else if let state = placemarks?.first?.administrativeArea,
                let city = placemarks?.first?.locality {
                completion(state, city)
            }
        }
    }
    
    // MARK: - REQUEST
    func downloadDocuments(lat: Double, lng: Double) {
        
        guard !isDownload else { return }
        
        var urlComplement = nullString
        if lat != 0, lng != 0 { urlComplement = String(format: Formats.shieldURLComplement, String(lat), String(lng)) }
        
        let loader = LoadingOverlay(text: LoaderStrings.getShield)
        let json = nullString
        let url = NetworkGET.SHIELDS + urlComplement
        let headers:[[String:String]] = []
        
        loader.showOverlay(view: parentView ?? self.view)
        self.view.isUserInteractionEnabled = false
        isDownload = true
        
        Network.buildRequest(urlApi: url, json: json, extraHeaders: headers, method: .methodGET, completion: { (response) in
            
            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true
            self.isDownload = false
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    self.mainDelegate?.showMessageInMain(withMessage: message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let result):
                
                //Transform object receiver to expected model
                self.sections = []
                let phoneLibrary: Array<OrganizationType> = arrayTransform(from: result as! Array<Any>)
                
                for phone in phoneLibrary {
                    if phone.organization_by_type != nil, phone.organization_by_type.count > 0 {
                        self.sections.append(phone)
                    }
                }
                
                self.table_shield.reloadData()
                break
                
            default:
                break
            }
        })
    }
    
    // MARK: - Location delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //stop updating location
            locationManager.stopUpdatingLocation()
            
            // Print out the location
            fetchCountryAndCity(location: location) { state, city in
                self.lbl_location.text = String(format: Formats.legalHeaderFormat, city, state)
            }
            
            // Download documents
            downloadDocuments(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            mainDelegate?.openSettingsPopup(title: ErrorStrings.title_disabledLocation,
                                            message: ErrorStrings.disabledLocation, settings: UIApplicationOpenSettingsURLString)
        }
    }
    
    //MARK: TableView DataSource and Delegate
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.shieldHeader) as! ShieldHeaderTableViewCell
        
        cell.lbl_title.text = sections[section].name
        cell.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        cell.btn_openClose.tag = section
        cell.btn_openClose.isSelected = expandedSections.contains(section)
        
        return cell
    }
    
    // Space between sections
    
    //Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            return sections[section].organization_by_type.count
        } else {
            return 0
        }
    }
    
    // Custom header heigth
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    // Custom cell heigth
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.shieldBody) as! ShieldBodyTableViewCell
        
        let item = sections[indexPath.section].organization_by_type[indexPath.row]
        cell.parentView = self
        cell.fillCell(item: item)
        
        return cell
    }
    
    // MARK: - Actions
    
}
