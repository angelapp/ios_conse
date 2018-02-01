//
//  VBGRouteOneViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VBGRouteOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VBGRouteProtocol {

    // MARK: - Outlets
    @IBOutlet weak var table_VBGRoute: UITableView!
    
    // MARK: - Properties
    let maxPageIndex: Int = 6
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        table_VBGRoute.delegate = self
        table_VBGRoute.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions Protocols
    func previusPage(){
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        
        reloadTable()
    }
    
    func nextPage(){
        guard currentIndex < maxPageIndex else { return }
        currentIndex += 1
        
        reloadTable()
    }
    
    // MARK: - Private Functions
    private func reloadTable() {
        let indexPath = IndexPath(row: 0, section: 0)
        table_VBGRoute.scrollToRow(at: indexPath, at: .top, animated: true)
        table_VBGRoute.reloadData()
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ProtectionRouteTableViewCell
        
        if currentIndex == VBGRouteIndex.route1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_1, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_1)
            
            return cell
        }
        else if currentIndex == VBGRouteIndex.route2.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_2, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_2)
            
            return cell
        }
        else if currentIndex == VBGRouteIndex.route3.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_3, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_3)
            
            return cell
        }
        else if currentIndex == VBGRouteIndex.route4.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_4, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_4)
            
            return cell
        }
        else if currentIndex == VBGRouteIndex.route5.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_5, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_5)
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.vgbRoute_6, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.vbgRouteDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.vgbRoute_6)
            
            return cell
        }
    }
}
