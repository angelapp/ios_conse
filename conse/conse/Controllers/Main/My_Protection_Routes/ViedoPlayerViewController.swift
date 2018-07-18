//
//  ViedoPlayerViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Photos

class ViedoPlayerViewController: UIViewController{ //, UIWebViewDelegate {
    
    // MARK: - Otlets
    //    @IBOutlet weak var videoPlayer: UIWebView!
    //    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var btn_play: UIButton!
    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var lbl_videoTitle: UILabel!
    
    // MARK: - Properties
    weak var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate
    var videoSTR: String!
    var videoTitle: String?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_videoTitle.text = videoTitle
        
        //        videoPlayer.delegate = self
        //        getVideo(forID: videoID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    // Show embed youtube video in a webview
    //    func getVideo(forID id: String) -> Void {
    //        let url = URL(string: String(format: Formats.youtubeEmbedFormat, id))
    //        videoPlayer.loadRequest(URLRequest(url: url!))
    //    }
    
    /// Show video in AVPlayer
    func playVideo() {
        let videoURL = NSURL(string: videoSTR!)
        let player = AVPlayer(url: videoURL! as URL)
        
        let playerController = LandscapeAVPlayerController()
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }
    
    func downloadVideo() {
        
        // Si aún no se han dado permisos para usra "FOTOS", se solicitan
        guard PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.notDetermined else {
            
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.denied) {
                    self.mainDelegate?.openConseSetting(title: ErrorStrings.title_disabledPhotos, message: ErrorStrings.deniedPhotos)
                    return
                }
            })
            return
        }
        
        // Se verifica que los permisos de "FOTOS" esten activos
        guard PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized else {
            self.mainDelegate?.openConseSetting(title: ErrorStrings.title_disabledPhotos, message: ErrorStrings.deniedPhotos)
            return
        }
        
        // Cast de URL (Es necesario poner loader)
        guard let url = URL(string: self.videoSTR!), let urlData = NSData(contentsOf: url) else {
            self.mainDelegate?.showMessageInMain(withMessage: ErrorStrings.failedDownload)
            return
        }
        
        // Se crea la ruta donde será almacenado el video. (Carrete)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        let fileName = self.videoTitle?.replacingOccurrences(of: " ", with: "_")
        let filePath="\(documentsPath)/\(fileName ?? "Video_Conse").mp4"
        
        // Valida que el archivo no exista
        guard !FileManager.default.fileExists(atPath: filePath) else {
            mainDelegate?.showMessageInMain(withMessage: ErrorStrings.alreadyExisted)
            return
        }
        
        // Se descarga el archivo desde la url Asincronamente (PONER LOADER)
        DispatchQueue.main.async {
            urlData.write(toFile: filePath, atomically: true)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
            }) { completed, error in
                if completed {
                    self.mainDelegate?.showMessageInMain(withMessage: ErrorStrings.succedDownload)
                }
                else {
                    self.mainDelegate?.showMessageInMain(withMessage: ErrorStrings.failedDownload)
                }
            }
        }
    }
    
    @IBAction func playVideo (_ sender: UIButton) {
        
        switch sender {
        case btn_download:
            downloadVideo()
            break
        default:
            playVideo()
            break
        }
    }
    
    // MARK: - WebView Delegate
    //    func webViewDidStartLoad(_ webView: UIWebView) {
    //        loader.startAnimating()
    //    }
    //
    //    func webViewDidFinishLoad(_ webView: UIWebView) {
    //        loader.stopAnimating()
    //    }
}
