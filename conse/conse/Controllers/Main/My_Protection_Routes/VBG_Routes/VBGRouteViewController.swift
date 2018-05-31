//
//  VBGRouteViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VBGRouteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, VBGRouteTabProtocol {

    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var button_collection: UICollectionView!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .vbgRoute)
    private let vbgRouteIndex: Int = 0
    private let videoIndex: Int = 1
    
    var currentTab: Int = 0
    var vbgRoute_tab: VBGRouteOneViewController!
    var video_tab: ViedoPlayerViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        instanciateTabs()
        
        currentTab = vbgRouteIndex
        changeTab()
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 100, height: 40)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func instanciateTabs() {
        vbgRoute_tab = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.vbgRouteOne) as! VBGRouteOneViewController
        video_tab = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.videoPLayer) as! ViedoPlayerViewController
    }
    
    private func showTab(tab: UIViewController) {
        
        if container.subviews.count > 0 {
            let vc = self.childViewControllers.last
            vc?.willMove(toParentViewController: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParentViewController()
        }
        
        //Agrega el nuevo controlador como hijo
        addChildViewController(tab)
        //Se ajusta el tamaño de nuevo vc al tamaño del contenedor
        tab.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        //Se agrega la vista al contenedor
        container.addSubview(tab.view)
        //recarga el controlador
        tab.viewDidLoad()
        //Se notifica
        tab.didMove(toParentViewController: self)
    }
    
    // MARK: - Actions
    func changeTab() {
        
        switch currentTab {
            
        case videoIndex:
            video_tab.videoID = VideosID.vbg_video
            video_tab.videoTitle = VideosTitles.vbg_video
            showTab(tab: video_tab)
            break
            
        default:
            showTab(tab: vbgRoute_tab)
            break
        }
    }

    // MARK: - Public Functions (Access by protocols)
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.VBGRouteTabs, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.vbgRoutesTabDelegate = self
        cell.titleButton = tabs[indexPath.row]
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle()
        
        return cell
    }
}
