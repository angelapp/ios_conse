//
//  VideoTutorialViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import CoreLocation

class VideoTutorialViewController: UIViewController, CLLocationManagerDelegate {//, UIWebViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_play: UIButton!
    //    @IBOutlet weak var videoPlayer: UIWebView!
    //    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    var backToHome = false
    
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        videoPlayer.delegate = self
        //        getVideo(forID: AplicationRuntime.sharedManager.getvideoID())
        
        btn_next.imageView?.contentMode = .scaleAspectFit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    //    private func getVideo(forID id: String) -> Void {
    //        let url = URL(string: String(format: Formats.youtubeEmbedFormat, id))
    //        videoPlayer.loadRequest(URLRequest(url: url!))
    //    }
    
    private func playVideo() {
        
        guard let path = Bundle.main.path(forResource: VideosID.tutorial, ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerController = LandscapeAVPlayerController()
        playerController.player = player
        
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // MARK: - Webview Delegate
    //    func webViewDidStartLoad(_ webView: UIWebView) {
    //        loader.startAnimating()
    //    }
    //
    //    func webViewDidFinishLoad(_ webView: UIWebView) {
    //        loader.stopAnimating()
    //    }
    
    // MARK: - Action
    @IBAction func backAction(_ sender: UIButton) {
        
        switch sender {
            
        case btn_play:
            playVideo()
            break
            
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
                                       settings: UIApplicationOpenSettingsURLString //URL_GENERAL_SETTINGS
                )
                return
            }
            
            // Check if GPS is Enable
            // Valida si los servicios de localización estan activos
            guard CLLocationManager.locationServicesEnabled() else {
                self.showSettingsPopup(title: ErrorStrings.title_disabledLocation,
                                       message: ErrorStrings.disabledLocation,
                                       settings: UIApplication.LaunchOptionsKey.location.rawValue //URL_LOCATION_SERVICES
                )
                return
            }
            
            // Valida si se han solicitado permisos para usar la localización
            guard CLLocationManager.authorizationStatus() != CLAuthorizationStatus.notDetermined else {
                locationManager.requestWhenInUseAuthorization()
                return
            }
            
            // Valida si esta permitido el uso de la localización
            guard DocumentBankViewController.isLocationPermissionGranted() else {
                self.showConseSettings(title: ErrorStrings.title_disabledLocation, message: ErrorStrings.deniedLocation)
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
