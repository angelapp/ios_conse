//
//  CommunityViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 23/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UIDocumentInteractionControllerDelegate, CommunityProtocol {

    // MARK: - Outlets
    @IBOutlet weak var table_community: UITableView!
    
    // MARK: - Properties
    var documentList: Array<MyCommunityItem> = []
    var expandedSections : NSMutableSet = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        documentList = getMyCommunityDocuments()
        table_community.delegate = self
        table_community.dataSource = self
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
        self.table_community.reloadData()
        viewDidLayoutSubviews()
    }
    
    // MARK: - Functions
    func openShareDocument(documentName: String, fileExt: String, action: FileActions) {
        guard let pdf = Bundle.main.url(forResource: documentName, withExtension: fileExt, subdirectory: nil, localization: nil) else { return }
        
        if action == .open {
//            let documentInteractionController = UIDocumentInteractionController(url: pdf)
//            documentInteractionController.delegate = self
//            documentInteractionController.presentPreview(animated: true)
            
            let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.openFile) as! OpenFilePopupViewController
            
            nextVC.fileName = documentName
            nextVC.fileExt = fileExt
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            present(nextVC, animated: true, completion: nil)
        }
        
        if action == .share {
            let objectsToShare = [pdf]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return documentList.count
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.communityHeader) as! CommunityHeaderTableViewCell
        
        cell.lbl_title.text = documentList[section].title
        cell.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        cell.btn_openClose.tag = section
        cell.btn_openClose.isSelected = expandedSections.contains(section)
        
        return cell
    }
    
    // Auto ajust header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado del header
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            return 1
        } else {
            return 0
        }
    }
    
    // Auto ajust Row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.communityBody) as! CommunityBodyTableViewCell
        
        cell.item = documentList[indexPath.section]
        cell.communityDelegate = self
        cell.fillCell()
        
        return cell
    }
    
    // MARK:  - UIDocumentInteractionController delegates
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }

}
