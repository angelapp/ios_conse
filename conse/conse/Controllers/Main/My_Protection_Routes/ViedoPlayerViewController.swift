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
    @IBOutlet weak var lbl_videoTitle: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Properties
    var videoID: String!
    var videoTitle: String?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_videoTitle.text = videoTitle
        videoPlayer.delegate = self
        getVideo(forID: videoID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    func getVideo(forID id: String) -> Void {
        let url = URL(string: String(format: Formats.youtubeEmbedFormat, id))
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
