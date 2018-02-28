//
//  AboutUsTab2ViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class AboutUsTab2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table_aboutWeDo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.table_aboutWeDo.delegate = self
        self.table_aboutWeDo.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private functions
    // Lanza navegador con los términos y condiciones
    @objc func tapLink(sender: UITapGestureRecognizer) {
        
        let stringURL = AboutNRC_page_2.href_5
        let webURL = stringURL.contains(Strings.hasHTTPProtocol) ? stringURL : Strings.httpProtocol + stringURL
        
        if let url = URL(string: webURL), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            }
            else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
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
        
        var cell: AboutNRC2TableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo1, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.lbl_wedo_text_1.attributedText = addBoldWord(forText: AboutNRC_page_2.text_1, toWord: AboutNRC_page_2.inBold_1, fontSize: cell.lbl_wedo_text_1.font.pointSize)
            
            return cell
        }
        else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo2, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.img_wedo_photo_1.image =  #imageLiteral(resourceName: "foto_educacion")
            
            return cell
        }
        else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo3, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.lbl_wedo_text_2.attributedText = addBoldWord(forText: AboutNRC_page_2.text_2, toWord: AboutNRC_page_2.inBold_2, fontSize: cell.lbl_wedo_text_2.font.pointSize)
            
            return cell
        }
        else if indexPath.row == 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo4, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.img_wedo_photo_2.image = #imageLiteral(resourceName: "foto_asistencia")
            
            return cell
        }
        else if indexPath.row == 4 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo5, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.lbl_wedo_text_3.attributedText = addBoldWord(forText: AboutNRC_page_2.text_3, toWord: AboutNRC_page_2.inBold_3, fontSize: cell.lbl_wedo_text_3.font.pointSize)
            
            return cell
        }
        else if indexPath.row == 5 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo6, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.img_wedo_photo_3.image = #imageLiteral(resourceName: "foto_alojamiento")
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWeDo7, for: indexPath) as! AboutNRC2TableViewCell
            
            cell.lbl_wedo_text_4.text = AboutNRC_page_2.text_4
            cell.lbl_wedo_text_5.attributedText = addLinkStyle(forText: AboutNRC_page_2.text_5)
            
            // Gesture for link
            let tapLink = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
            cell.lbl_wedo_text_5.isUserInteractionEnabled = true
            cell.lbl_wedo_text_5.addGestureRecognizer(tapLink)
            
            return cell
        }
    }

}
