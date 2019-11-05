//
//  ViewController.swift
//  IosPlayAudioVideo
//
//  Created by Ankita Jain on 2019-11-05.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

   var video = AVPlayer()
        var videoPlayer = AVPlayerViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        @IBAction func btnPlayLocalAction(_ sender: UIBarButtonItem) {
            if let path = Bundle.main.path(forResource: "Toronto", ofType: "mp4"){
                
                self.video = AVPlayer(url: URL(fileURLWithPath: path))
                self.videoPlayer = AVPlayerViewController()
                self.videoPlayer.player = video
                
                self.present(self.videoPlayer, animated: true, completion: {
                    self.video.play()
                })
            }
        }
        
        @IBAction func btnPlayLiveAction(_ sender: UIBarButtonItem) {
            //http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v
            if let pathUrl = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"){
                
                self.video = AVPlayer(url: pathUrl)
                self.videoPlayer = AVPlayerViewController()
                self.videoPlayer.player = video
                
                self.present(self.videoPlayer, animated: true, completion: {
                    self.video.play()
                })
            }
            
        }
    }

