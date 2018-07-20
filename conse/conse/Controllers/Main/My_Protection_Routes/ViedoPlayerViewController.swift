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

class ViedoPlayerViewController: UIViewController {
    
    // MARK: - Otlets
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playVideo (_ sender: UIButton) {
        
        switch sender {
            
        case btn_download:
            self.downloadVideo(videoSTR: videoSTR, videoTitle: videoTitle)
            break
            
        default:
            self.playVideo(videoSTR: videoSTR)
            break
        }
    }
}
