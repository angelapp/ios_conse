//
//  AboutUsTab3ViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class AboutUsTab3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table_where: UITableView!
    
    private let link_office: Int = 0
    private let link_fb: Int = 1
    private let link_tw: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table_where.delegate = self
        self.table_where.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private functions
    // Lanza navegador con los términos y condiciones
    @objc func tapLink(sender: UITapGestureRecognizer) {
        
        let linkTapped = sender.view!
        let tagID = linkTapped.tag
        
        var stringURL = nullString
        switch tagID {
            
        case link_office:
            stringURL = AboutNRC_page_3.href_2
            break
            
        case link_fb:
            stringURL = AboutNRC_page_3.href_3
            break
            
        default:
            stringURL = AboutNRC_page_3.href_4
            break
        }
        
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
        return 2
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
        
        var cell: AboutNRC3TableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWhere1, for: indexPath) as! AboutNRC3TableViewCell
            
            cell.lbl_where_1.text = AboutNRC_page_3.text_1
            
            cell.lbl_link_office.attributedText = addLinkStyle(forText: AboutNRC_page_3.text_2)
            cell.lbl_link_office.tag = link_office
            
            // Gesture for link
            let tapLink = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
            cell.lbl_link_office.isUserInteractionEnabled = true
            cell.lbl_link_office.addGestureRecognizer(tapLink)
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.aboutWhere2, for: indexPath) as! AboutNRC3TableViewCell
            
            cell.img_map.image = #imageLiteral(resourceName: "foto_mapa")
            
            cell.lbl_link_facebook.attributedText = addLinkStyle(forText: AboutNRC_page_3.text_3)
            cell.lbl_link_facebook.tag = link_fb
            
            cell.lbl_link_twitter.attributedText = addLinkStyle(forText: AboutNRC_page_3.text_4)
            cell.lbl_link_twitter.tag =  link_tw
            
            // Gesture for link
            let tapLinkFB = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
            cell.lbl_link_facebook.isUserInteractionEnabled = true
            cell.lbl_link_facebook.addGestureRecognizer(tapLinkFB)
            
            let tapLinkTW = UITapGestureRecognizer(target: self, action: #selector(self.tapLink))
            cell.lbl_link_twitter.isUserInteractionEnabled = true
            cell.lbl_link_twitter.addGestureRecognizer(tapLinkTW)
            
            
            return cell
        }
    }
}

