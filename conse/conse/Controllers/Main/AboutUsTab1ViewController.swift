//
//  AboutUsTab1ViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class AboutUsTab1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table_aboutNRC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table_aboutNRC.delegate = self
        self.table_aboutNRC.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        
        var cell: AboutNRC1TableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutNRC1, for: indexPath) as! AboutNRC1TableViewCell
            
            return cell
        }
        else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutNRC2, for: indexPath) as! AboutNRC1TableViewCell
            
            cell.lbl_text_1.attributedText = addBoldWord(forText: AboutNRC_page_1.text_1, toWord: AboutNRC_page_1.inBold_1, AboutNRC_page_1.inBold_2, fontSize: cell.lbl_text_1.font.pointSize)
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutNRC3, for: indexPath) as! AboutNRC1TableViewCell
            
            cell.lbl_about_2.text = AboutNRC_page_1.text_2
            cell.lbl_about_3.text = AboutNRC_page_1.text_3
            cell.lbl_about_4.text = AboutNRC_page_1.text_4
            cell.lbl_about_5.text = AboutNRC_page_1.text_5
            
            return cell
        }
    }
}
