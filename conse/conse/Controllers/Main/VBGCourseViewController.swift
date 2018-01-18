//
//  VBGCourseViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VBGCourseViewController: UIViewController, VBGProtocol, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var vbg_table: UITableView!
    
    // MARK: - Properties
    let maxPageIndex: Int = 1
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex(forCourse: .VBG)
        
        vbg_table.delegate = self
        vbg_table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Protocol Access
    func previusPage(){
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        vbg_table.reloadData()
    }
    
    func nextPage(){
        guard currentIndex < maxPageIndex else { return }
        currentIndex += 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        vbg_table.reloadData()
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
        
        var cell: VBGTableViewCell
        
        if currentIndex == VBG_INDEX.M0P0.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M0P0, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM0P0()
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M0P1, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM0P1()
            return cell
        }
    }
}
