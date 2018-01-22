//
//  LegalViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LegalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var table_legal: UITableView!
    
    // MARK: - Properties
    var sections: Array<DocumentTextType> = []
    var expandedSections : NSMutableSet = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadDocuments()
        self.table_legal.delegate = self
        self.table_legal.dataSource = self
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
        self.table_legal.reloadData()
        viewDidLayoutSubviews()
    }
    
    // MARK: - REQUEST
    func downloadDocuments() {
        
        let json = nullString
        let url = NetworkGET.LIBRARY_DOCS
        let headers:[[String:String]] = []
        
        Network.buildRequest(urlApi: url, json: json, extraHeaders: headers, method: .methodGET, completion: { (response) in
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    print(message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let result):
                
                //Transform object receiver to expected model
                self.sections = arrayTransform(from: result as! Array<Any>)
                self.table_legal.reloadData()
                
                break
                
            default:
                break
            }
        })
    }
    
    //MARK: TableView DataSource and Delegate
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.legalHeader) as! LegalHeaderTableViewCell
    
        cell.lbl_title.text = String(format: Formats.legalHeaderFormat, sections[section].name, AplicationRuntime.sharedManager.getCourseName(forID: sections[section].course))
        cell.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        cell.btn_openClose.tag = section
        cell.btn_openClose.isSelected = expandedSections.contains(section)
        
        return cell
    }
    
    // Space between sections
    
    //Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            return sections[section].document_by_type.count
        } else {
            return 0
        }
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado del header y de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.legalBody) as! LegalBodyTableViewCell
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedLink))
        
        cell.lbl_title.text = sections[indexPath.section].document_by_type[indexPath.row].name
        
        cell.lbl_title.isUserInteractionEnabled = true
        cell.lbl_title.tag = (indexPath.section * 100) + (indexPath.row)
        cell.lbl_title.addGestureRecognizer(tap)
        
        return cell
    }
    
    // MARK: - Actions
    @objc func tappedLink(sender: UITapGestureRecognizer) {
        
        let linkTapped = sender.view!
        let tagID = linkTapped.tag
        
        let sectionID = tagID / 100
        let rowID = tagID % 100
        
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.downloadPopup) as! DownloadPopupViewController
        
        nextVC.document = sections[sectionID].document_by_type[rowID]
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
        
    }
}
