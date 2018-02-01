//
//  LeadersRouteOneViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LeadersRouteOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LeadersRouteOneProtocol {

    // MARK: - Outlets
    @IBOutlet weak var table_LeadersRouteOne: UITableView!
    
    // MARK: - Properties
    let maxPageIndex: Int = 7
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_LeadersRouteOne.delegate = self
        table_LeadersRouteOne.dataSource = self
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
        table_LeadersRouteOne.scrollToRow(at: indexPath, at: .top, animated: true)
        table_LeadersRouteOne.reloadData()
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
        
        if currentIndex == LeadersRouteOneIndex.route1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_1, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_1)
            
            return cell
        }
        else if currentIndex == LeadersRouteOneIndex.route2.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_2, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_2)
            
            return cell
        }
        else if currentIndex == LeadersRouteOneIndex.route3.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_3, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_3)
            
            return cell
        }
        else if currentIndex == LeadersRouteOneIndex.route4.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_4, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_4)
            
            return cell
        }
        else if currentIndex == LeadersRouteOneIndex.route5.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_5, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_5)
            
            return cell
        }
        else if currentIndex == LeadersRouteOneIndex.route6.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_6, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_6)
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute1_7, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteOneDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute1_7)
            
            return cell
        }
    }
}
