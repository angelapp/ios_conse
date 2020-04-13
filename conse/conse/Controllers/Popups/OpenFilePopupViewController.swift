//
//  OpenFilePopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 30/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class OpenFilePopupViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var wkView: UIWebView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Properties
    var fileName: String = nullString
    var fileExt: String?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        wkView.delegate? = self
        navBar.topItem?.title = fileName
        
        openFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func openFile(){
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExt, subdirectory: nil, localization: nil) {
            wkView.loadRequest(URLRequest(url: fileURL))
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions
    @IBAction func acctionButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acction(_ sender: UIBarButtonItem) {
        guard let pdf = Bundle.main.url(forResource: fileName, withExtension: fileExt, subdirectory: nil, localization: nil) else { return }
        let objectsToShare = [pdf]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
}
