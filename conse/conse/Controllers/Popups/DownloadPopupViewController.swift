//
//  DownloadPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 21/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Alamofire
import UIKit

class DownloadPopupViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var btn_cancel: UIButton!
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var lbl_download: UILabel!
    
    // MARK: - Properties
    var document: Document!
    var mainDelegate: MainProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        fillPopup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func fillPopup() {
        guard document != nil else {
            buttonActions(btn_cancel)
            return
        }
        
        lbl_title.text = document.name
        lbl_description.text = document.description
        lbl_download.text = Strings.copy_download
    }
    
    private func downloadDoc() {
        let stringURl = document.file ?? nullString
        let fileURL = stringURl.contains(Strings.hasHTTPProtocol) ? stringURl : Strings.httpProtocol + stringURl
        
        lbl_download.text = Strings.copy_downloading
        Network.download(file: fileURL, completion: {(response) in
            
            switch response {
                
            case .succeeded(_, let msn):
                self.buttonActions(self.btn_cancel)
                self.mainDelegate?.showMessageInMain(withMessage: msn)
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            default:
                break
            }
        })
        
    }
    
    // MARK: - Actions
    @IBAction func buttonActions(_ sender: UIButton) {
        switch sender {
            
        case btn_download:
            downloadDoc()
            break
        
        default:
            self.dismiss(animated: true, completion: nil)
            break
        }
    }
}
