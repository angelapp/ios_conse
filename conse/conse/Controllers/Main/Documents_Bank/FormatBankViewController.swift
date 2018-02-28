//
//  FormatBankViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class FormatBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIDocumentInteractionControllerDelegate, FormatBankProtocol {

    // MARK: - Outlets
    @IBOutlet weak var table_formats: UITableView!
    
    // MARK: - Properties
    var listFormats: Array<FormatsBankItem> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listFormats = getFormatList()
        table_formats.delegate = self
        table_formats.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func openShareDocument(file: FormatsBankItem, action: FileActions) {
        guard let pdf = Bundle.main.url(forResource: file.file, withExtension: file.ext, subdirectory: nil, localization: nil) else { return }
        
        if action == .open {
            
            let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.openFile) as! OpenFilePopupViewController
            
            nextVC.fileName = file.file
            nextVC.fileExt = file.ext
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            present(nextVC, animated: true, completion: nil)
        }
        
        if action == .share {
            let body = String(format: Formats.bodyEmailShare, file.name)
            let objectsToShare = [body, pdf] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.setValue(Strings.title_for_share, forKey: subject)
            
            let loader = LoadingOverlay(text: Strings.loader_loading)
            loader.showOverlay(view: self.view)
            self.present(activityVC, animated: true, completion: {
                loader.hideOverlayView()
            })
        }
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFormats.count
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.formatBank) as! FormatBankTableViewCell
        
        cell.item = listFormats[indexPath.row]
        cell.formatBankDelegate = self
        cell.fillCell()
        
        return cell
    }
    
    // MARK:  - UIDocumentInteractionController delegates
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    
    // MARK: - Actions

}
