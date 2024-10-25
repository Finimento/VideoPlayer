//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Mike Finimento on 24.10.24.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    let data = "12225583_3840_2160_30fps"
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.layer.cornerRadius = 20
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        //print("playButtonTapped")
        
        let url = Bundle.main.url(forResource: data, withExtension: "mp4")
        guard let videoURL = url else { return }
        
        let player = AVPlayer(url: videoURL)
        let vc = AVPlayerViewController()
        
        vc.player = player
        
        present(vc, animated: true){
            vc.player?.play()
        }
    }
    

}

