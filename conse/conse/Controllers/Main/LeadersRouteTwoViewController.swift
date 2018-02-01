//
//  LeadersRouteTwoViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LeadersRouteTwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LeadersRouteTwoProtocol {

    // MARK: - Outlets
    @IBOutlet weak var table_LeadersRouteTwo: UITableView!
    
    // MARK: - Properties
    let maxPageIndex: Int = 5
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_LeadersRouteTwo.delegate = self
        table_LeadersRouteTwo.dataSource = self
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
        table_LeadersRouteTwo.scrollToRow(at: indexPath, at: .top, animated: true)
        table_LeadersRouteTwo.reloadData()
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
        
        if currentIndex == LeadersRouteTwoIndex.route1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute2_1, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteTwoDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute2_1)
            
            return cell
        }
        else if currentIndex == LeadersRouteTwoIndex.route2.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute2_2, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteTwoDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute2_2)
            
            return cell
        }
        else if currentIndex == LeadersRouteTwoIndex.route3.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute2_3, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteTwoDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute2_3)
            
            return cell
        }
        else if currentIndex == LeadersRouteTwoIndex.route4.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute2_4, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteTwoDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute2_4)
            
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.leadersRoute2_5, for: indexPath) as! ProtectionRouteTableViewCell
            
            cell.leadersRouteTwoDelegate = self
            cell.routeImage.image = UIImage(named: RoutesImages.leadersRoute2_5)
            
            return cell
        }
    }
}

