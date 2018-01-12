//
//  TestAlertViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class TestAlertViewController: UIViewController, TestAlertProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var cnt_step1: UIView!
    @IBOutlet weak var cnt_step2: UIView!
    
    @IBOutlet weak var img_step1: UIImageView!
    @IBOutlet weak var img_step2: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackTitle(forViewController: self, title: blankSpace)
        
        cnt_step1.isHidden = false
        cnt_step2.isHidden = true
        
        img_step1.image = #imageLiteral(resourceName: "circulo_amarillo")
        img_step2.image = #imageLiteral(resourceName: "circulo_blanco")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - functions
    func startStepTwo() {
        cnt_step1.isHidden = true
        cnt_step2.isHidden = false
        
        img_step1.image = #imageLiteral(resourceName: "circulo_blanco")
        img_step2.image = #imageLiteral(resourceName: "circulo_amarillo")
    }
    
    // MARK: - Actions
    @IBAction func sendAlertTest(_ sender: UIButton) {
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.sendAlertPopup) as! SendAlertPopupViewController
        
        nextVC.alertMessage = Strings.copy_testAlertMessage
        nextVC.launchVC = .testAlert
        nextVC.testAlertDelegate = self
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }

}
