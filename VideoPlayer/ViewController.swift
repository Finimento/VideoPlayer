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
    @IBOutlet weak var textField: UITextField!
    
    let data = ["", "112761-696336252_medium", "3343679-hd_1280_720_30fps", "12225583_3840_2160_30fps", "Autofahrt_hoch_mit_Ton", "b19735545-hd_1080_1920_60fps"]
    
    var selectedMovieTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        textField.tintColor = .clear
        
        pickerView.backgroundColor = .systemBackground
        
        playButton.layer.cornerRadius = 20
        
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        //print("playButtonTapped")
        guard let title = selectedMovieTitle else { return }
        
        let url = Bundle.main.url(forResource: title, withExtension: "mp4")
        guard let videoURL = url else { return }
        
        let player = AVPlayer(url: videoURL)
        let vc = AVPlayerViewController()
        
        vc.player = player
        
        present(vc, animated: true){
            vc.player?.play()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Hier wird der ausgewählte Titel in selectedMovieTitle gespeichert
        selectedMovieTitle = data[row]
        
        // Textfeld aktualisieren, um die Auswahl anzuzeigen
        textField.text = data[row]
    }
}
