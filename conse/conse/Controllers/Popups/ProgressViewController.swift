//
//  ProgressViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 30/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var levelProgress: UITableView!
    @IBOutlet weak var progressTitle: UILabel!
    @IBOutlet weak var progressSegment: UISegmentedControl!
    
    // MARK: - Properties
    private let VGBIndex: Int = 0
    private let LEADERSIndex: Int = 1
    
    var progress: Array<ModuleProgressItem> = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        customSegment()
        progressTitle.text = Strings.copy_progressTitle
        progressSegment.selectedSegmentIndex = VGBIndex
        progress = getProgress(forCourse: progressSegment.selectedSegmentIndex)
        
        levelProgress.delegate = self
        levelProgress.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func customSegment() {
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10.0)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 10.0)], for: .selected)
    }
    
    // MARK: - Actions
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmemtedChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == VGBIndex {
            
        }
        else {
            
        }
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
