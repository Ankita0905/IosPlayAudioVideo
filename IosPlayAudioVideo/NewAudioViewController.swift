//
//  NewAudioViewController.swift
//  IosPlayAudioVideo
//
//  Created by Ankita Jain on 2019-11-06.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class NewAudioViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    
    @IBAction func btnActionPlay(_ sender: UIButton) {
        
        guard let path = Bundle.main.path(forResource: "Motivational", ofType: "mp3") else
        
        {
            return
        }
        let url=URL(fileURLWithPath: path)
        let player=AVPlayer(url: url)
        let playerViewController=AVPlayerViewController()
        playerViewController.player=player
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
            
            
            //to give background image to the player
            if let frame=playerViewController.contentOverlayView?.bounds{
                let imageView=UIImageView(image: UIImage(named: "music"))
                imageView.frame=frame
                playerViewController.contentOverlayView?.addSubview(imageView)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
