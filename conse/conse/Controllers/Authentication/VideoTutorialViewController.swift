//
//  VideoTutorialViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VideoTutorialViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var videoPlayer: UIWebView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.delegate = self
        getVideo(forID: AplicationRuntime.sharedManager.getvideoID())
        
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
        videoPlayer.loadRequest(URLRequest(url: url!))
    }
    
    // MARK: - Webview Delegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        loader.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loader.stopAnimating()
    }

}
