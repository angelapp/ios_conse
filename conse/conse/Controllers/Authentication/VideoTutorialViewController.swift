//
//  VideoTutorialViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import WebKit

class VideoTutorialViewController: UIViewController, WKNavigationDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var videoPlayer: WKWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.navigationDelegate = self
        getVideo(forID: "j6ADr_icqH8")//AplicationRuntime.sharedManager.getvideoID())
        
        setBackTitle(forViewController: self, title: blankSpace)
        btn_next.imageView?.contentMode = .scaleAspectFit
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
    
    // MARK: - Webview Delegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loader.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loader.stopAnimating()
    }

}
