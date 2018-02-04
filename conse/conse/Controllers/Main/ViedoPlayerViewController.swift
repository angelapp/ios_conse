//
//  ViedoPlayerViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import WebKit

class ViedoPlayerViewController: UIViewController, WKNavigationDelegate {

    // MARK: - Otlets
    @IBOutlet weak var videoPlayer: WKWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    var videoID: String = "j6ADr_icqH8"
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.navigationDelegate = self
        getVideo(forID: videoID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    func getVideo(forID id: String) -> Void {
        let url = URL(string: String(format: Strings.youtubeEmbedFormat, id))
        videoPlayer.load(URLRequest(url: url!))
    }
    
    // MARK: - WKNavigation Delegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loader.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loader.stopAnimating()
    }
}
