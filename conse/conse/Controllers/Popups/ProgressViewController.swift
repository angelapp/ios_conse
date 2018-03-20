//
//  ProgressViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 30/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, ProgressTabProtocol {

    // MARK: - Outlets
    @IBOutlet weak var button_collection: UICollectionView!
    @IBOutlet weak var levelProgress: UITableView!
    @IBOutlet weak var progressTitle: UILabel!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .progress)
    private let tab_1: Int = 0
    private let tab_2: Int = 1
    
    var currentTab: Int = 0
    var progress: Array<ModuleProgressItem> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        progressTitle.text = Strings.copy_progressTitle
        currentTab = tab_1
        changeTab()
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        levelProgress.delegate = self
        levelProgress.dataSource = self
        
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 100, height: 40)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeTab(animated: Bool? = false) {
        progress = currentTab == tab_2 ? getProgress(forCourse: CourseIDs.PLC.rawValue) : getProgress(forCourse: CourseIDs.VBG.rawValue)
        levelProgress.reloadData()
        if animated! { levelProgress.animate() }
    }
    
    // MARK: - Actions
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - News Protocol functions
    func changeTabSelected(toPosition position: Int, animated: Bool) {
        currentTab = position
        button_collection.reloadData()
        changeTab(animated: true)
    }
    
    // MARK: - Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.progressTabs, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.progressTabDelegate = self
        cell.titleButton = tabs[indexPath.row]
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()
        
        return cell
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progress.count
    }
    
    // tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.progress) as! ProgressTableViewCell
        
        cell.img_insignia.image = UIImage(named: progress[indexPath.row].image)
        cell.lbl_level.text = progress[indexPath.row].title
        cell.progressBar.heightAnchor.constraint(equalToConstant: 20)
        cell.progressBar.setProgress(progress[indexPath.row].progress, animated: false)
        
        return cell
    }
}
