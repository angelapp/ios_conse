//
//  VideoTutorialViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import CoreLocation

class VideoTutorialViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var videoPlayer: UIWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    var backToHome = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.delegate = self
        getVideo(forID: AplicationRuntime.sharedManager.getvideoID())
        
        btn_next.imageView?.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    func getVideo(forID id: String) -> Void {
        let url = URL(string: String(format: Strings.youtubeEmbedFormat, id))
        videoPlayer.loadRequest(URLRequest(url: url!))
    }
    
    // MARK: - Webview Delegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        loader.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
    }

    // MARK: - Action
    @IBAction func backAction(_ sender: UIButton) {
        
        switch sender {
            
        case btn_next:
            // Check if next buttonreturn to home
            guard !backToHome else {
                dismiss(animated: true, completion: nil)
                return
            }
            
            // Check Intenet Conexión
            guard ConnectionCheck.isConnectedToNetwork() else {
                self.showSettingsPopup(title: ErrorStrings.title_disabledInternet,
                                       message: ErrorStrings.disabledIntenert,
                                       settings: URL_GENERAL_SETTINGS)
                return
            }
            
            // Check if GPS is Enable
            guard CLLocationManager.locationServicesEnabled() else {
                self.showSettingsPopup(title: ErrorStrings.title_disabledLocation,
                                       message: ErrorStrings.disabledLocation,
                                       settings: URL_LOCATION_SERVICES)
                return
            }
            
            performSegue(withIdentifier: segueID.tutorialResgister, sender: self)
            break
            
        default:
            self.dismiss(animated: true, completion: nil)
            break
        }
    }
}
