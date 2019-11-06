//
//  AudioViewController.swift
//  IosPlayAudioVideo
//
//  Created by Ankita Jain on 2019-11-05.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AudioViewController: UIViewController,AVAudioPlayerDelegate {

    var soundPlayEffect: AVAudioPlayer!
    var updater : CADisplayLink! = nil
    
    @IBOutlet weak var lblCurrentTime: UILabel!
      @IBOutlet weak var soundProgressBar: UIProgressView!
      
   override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            lblCurrentTime.text = "00:00:00"
        }

        @IBAction func startPlay(_ sender: UIBarButtonItem) {
            startAudioPlay()
        }
    @IBAction func stopPlay(_ sender: UIButton) {
        stopAudioPlay()
    }
//    @IBAction func stopPlay(_ sender: UIBarButtonItem) {
//            stopAudioPlay()
//        }
       
        @IBAction func changeVolume(_ sender: UISlider) {
            if soundPlayEffect != nil
            {
                soundPlayEffect.volume = sender.value
            }
        }
        
        func startAudioPlay()
        {

            //Add you own MP3 files in to project
            let path = Bundle.main.path(forResource: "Motivational", ofType:"mp3")
            let url = URL(fileURLWithPath: path!)
        
            do {
                soundPlayEffect = try AVAudioPlayer(contentsOf: url)
                soundPlayEffect.prepareToPlay()
                updater = CADisplayLink(target: self, selector: #selector(AudioViewController.trackAudio))
                //updater.preferredFramesPerSecond = 1
                updater.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
                 lblCurrentTime.text = "\(soundPlayEffect.currentTime)"
                
                soundPlayEffect.play()
                
            } catch {
                    NSLog("Error Loading Audio File")
            }
        }
        
        //Display Progress
        @objc func trackAudio() {
            if soundPlayEffect != nil
            {
                let normalizedTime = Float(soundPlayEffect.currentTime / soundPlayEffect.duration)
                soundProgressBar.progress = normalizedTime
                lblCurrentTime.text = stringFromTimeInterval(interval: soundPlayEffect.currentTime)
            }
        }
        
        func stringFromTimeInterval(interval: TimeInterval) -> String {
            
            let ti = NSInteger(interval)
            
            //let ms = Int(interval.truncatingRemainder(dividingBy: 1) * 1000)
            let seconds = ti % 60
            let minutes = (ti / 60) % 60
            let hours = (ti / 3600)
            
            return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds) as String
        }

        
        func stopAudioPlay()
        {
            if soundPlayEffect != nil {
                soundPlayEffect.stop()
                soundPlayEffect = nil
            }
            lblCurrentTime.text = "00:00:00"
            soundProgressBar.progress = 0
        }
        
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer,
            flag: Bool) {
            if flag
            {
                stopAudioPlay()
            }
        }
        
        func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer,
                                            error: Error?) {
            NSLog(error.debugDescription)
        }
        
        func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        }
        
        func audioPlayerEndInterruption(player: AVAudioPlayer) {
        }

    }
