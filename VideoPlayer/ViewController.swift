//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Mike Finimento on 24.10.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.layer.cornerRadius = 20
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("playButtonTapped")
    }
    

}

