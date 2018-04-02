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
    @IBOutlet weak var progressMessage: UILabel!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .progress)
    private let tab_1: Int = 0
    private let tab_2: Int = 1
    private let mod_2: Int = 1
    private let mod_3: Int = 2
    private let mod_4: Int = 3
    
    var currentTab: Int = 0
    var progress: Array<ModuleProgressItem> = []
    weak var mainDelgate = AplicationRuntime.sharedManager.mainDelegate
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        progressTitle.text = ProgressStrings.title
        progressMessage.text = ProgressStrings.message
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
    
    func changeTab() {
        progress = currentTab == tab_2 ? getProgress(forCourse: CourseIDs.PLC.rawValue) : getProgress(forCourse: CourseIDs.VBG.rawValue)
        
        let indexPath = IndexPath(row: currentTab, section: 0)
        button_collection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.right, animated: true)
        
        levelProgress.reloadData()
    }
    
    @objc func imageTapped (sender: UITapGestureRecognizer) {
        
        let imgTapped = sender.view!
        let imgTag = imgTapped.tag
        
        // EL valor por defecto del indice es la pagina inicial
        var index: Int = 0
        
        // Obtine el indice del modulo para el curso VBG
        if currentTab == tab_1 {
            switch imgTag {
                
            case mod_2:
                index = VBG_INDEX.VBG_13.rawValue
                break
                
            case mod_3:
                index = VBG_INDEX.VBG_17.rawValue
                break
                
            case mod_4:
                index = VBG_INDEX.VBG_36.rawValue
                break
                
            default:
                break
            }
        }
        // Obtine el indice del modulo para el curso Lideres
        else {
            switch imgTag {
                
            case mod_2:
                index = LEADERS_INDEX.LEADERS_11.rawValue
                break
                
            case mod_3:
                index = LEADERS_INDEX.LEADERS_28.rawValue
                break
                
            case mod_4:
                index = LEADERS_INDEX.LEADERS_46.rawValue
                break
                
            default:
                break
            }
        }
        
        displayModule(index: index)
    }
    
    func displayModule(index: Int){
        let course: CourseIDs = currentTab == tab_1 ? .VBG : .PLC
        let vc: ViewControllerTag = currentTab == tab_1 ? .courseVBG : .coursePLC

        AplicationRuntime.sharedManager.setProgress(forCourse: course, progress: index)
        mainDelgate?.addToContainer(viewControllerID: vc)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - News Protocol functions
    func changeTabSelected(toPosition position: Int) {
        currentTab = position
        button_collection.reloadData()
        changeTab()
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
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        cell.img_insignia.tag = indexPath.row
        cell.img_insignia.isUserInteractionEnabled = true
        cell.img_insignia.addGestureRecognizer(tapImage)
        
        return cell
    }
}
