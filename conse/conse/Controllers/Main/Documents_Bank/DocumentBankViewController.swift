//
//  DocumentBankViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import CoreLocation

class DocumentBankViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DocumentsTabProtocol {

    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var button_collection: UICollectionView!
    
    // MARK: - Properties
    private let tabs = getTabs(forViewID: .documentBank)
    private let formatsIndex: Int = 0
    private let legalIndex: Int = 1
    private let shieldIndex: Int = 2
    
    var currentTab: Int = 0
    var tab_formats: FormatBankViewController!
    var tab_legal: LegalViewController!
    var tab_shield: ProtectionShieldViewController!
    var mainDelegate: MainProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateTabs()
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        if let flowLayout = button_collection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 300, height: 40)
        }
        
        updateTabs()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func instanciateTabs() {
        tab_formats = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.formatBank) as! FormatBankViewController
        tab_legal = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.legal) as! LegalViewController
        tab_shield = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.protectionShield) as! ProtectionShieldViewController
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
    
    // MARK: - Public Functions (Access by protocols)
    func changeTabSelected(toPosition position: Int) {
        currentTab = position
        updateTabs()
        button_collection.reloadData()
    }
    
    // MARK: - Actions
    func updateTabs() {
        
        switch currentTab {
            
        case shieldIndex:
            
            // Check if GPS is Enable
            guard CLLocationManager.locationServicesEnabled() else {
                self.mainDelegate?.openSettingsPopup(title: Strings.error_title_locationDisabled,
                                                     message: Strings.error_message_locationDisabled,
                                                     settings: URL_LOCATION_SERVICES)
                
                currentTab = formatsIndex
                updateTabs()
                return
            }
            
            // Check Intenet Conexión
            guard ConnectionCheck.isConnectedToNetwork() else {
                self.mainDelegate?.openSettingsPopup(title: Strings.error_title_notInternetConection,
                                                     message: Strings.error_message_notIntenertConection,
                                                     settings: URL_GENERAL_SETTINGS)
                
                currentTab = formatsIndex
                updateTabs()
                return
            }
            
            let indexPath = IndexPath(row: currentTab, section: 0)
            button_collection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.right, animated: true)
            
            tab_shield.parentView = self.view
            showTab(tab: tab_shield)
            break
            
        case legalIndex:
            
            // Check Intenet Conexión
            guard ConnectionCheck.isConnectedToNetwork() else {
                self.mainDelegate?.openSettingsPopup(title: Strings.error_title_notInternetConection,
                                                     message: Strings.error_message_notIntenertConection,
                                                     settings: URL_GENERAL_SETTINGS)
                
                currentTab = formatsIndex
                updateTabs()
                return
            }
            
            tab_legal.parentView = self.view
            showTab(tab: tab_legal)
            break
            
        default:
            showTab(tab: tab_formats)
            break
        }
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.tabButtons, for: indexPath) as! TabButtonsCollectionViewCell
        
        cell.documentsTabDelegate = self
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.underline.isHidden = !cell.tab_button.isSelected
        cell.setButtonTitle(title: tabs[indexPath.row])
        
        return cell
    }
    
}
