//
//  ViedoPlayerViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ViedoPlayerViewController: UIViewController, UIWebViewDelegate {

    // MARK: - Otlets
    @IBOutlet weak var videoPlayer: UIWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    var videoID: String = "j6ADr_icqH8"
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.delegate = self
        getVideo(forID: videoID)
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
    
    // MARK: - WebView Delegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        loader.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
    }
}
