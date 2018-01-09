//
//  LoaderViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 8/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var loaderBackground: UIView!
    @IBOutlet weak var loaderLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properites
    var loaderText: String!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        loader.startAnimating()
        
        // Observer for close loader
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopLoader(notification:)), name: NSNotification.Name(rawValue: observerName.stop_loader), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private functions
    private func addStyles() {
        loaderBackground.addRadius(radius: 10)
        loader.frame = CGRect(x: 98, y: 20, width: 40, height: 40)
    }
    
    @objc private func stopLoader(notification: NSNotification) {
        loader.stopAnimating()
        self.dismiss(animated: true, completion: nil)
    }

}
