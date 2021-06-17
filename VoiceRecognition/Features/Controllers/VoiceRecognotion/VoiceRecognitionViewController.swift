//
//  ViewController.swift
//  VoiceRecognition
//
//  Created by Salah  on 6/13/21.
//

import UIKit
import InstantSearchVoiceOverlay

class VoiceRecognitionViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    var lang:String?
        
    var count = 0
    
    @IBOutlet weak var resultText: UILabel!
    
    lazy var  overLay : VoiceOverlayController = {
        let recordableHandler = {
            return SpeechController(locale: Locale(identifier: self.lang!))
        }
        return VoiceOverlayController(speechControllerHandler: recordableHandler)
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPSpeechController()
        startButton.isHidden = true
        UIUtilities.createCircularViewforView(self.startButton, withRadius: 10)
        }

    
    private func setUPSpeechController(){
        overLay.settings.autoStart = true
        overLay.settings.autoStop = false
        overLay.settings.layout.inputScreen.subtitleBulletList = [""]
        switch lang {
        case "ar-SA":
            overLay.settings.layout.inputScreen.titleListening = "انا اسمعك"
            overLay.settings.layout.inputScreen.titleInProgress = "انا اسمعك"
            startButton.setTitle("مره اخري", for: .normal)
        default:
            overLay.settings.layout.inputScreen.titleListening = "I am listening"
            overLay.settings.layout.inputScreen.titleInProgress = "I am listening"
            startButton.setTitle("Again", for: .normal)

        }
        overlayStart()
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        overlayStart()
    }
    
    
    private func overlayStart(){
        overLay.start(on: self) { [self] (text, final, _) in
            if final{
                self.resultText.text = text
                self.count += 1
                if count > 0{
                    self.startButton.isHidden = false
                }
            }else{
                print("In Progress:",text)
            }

        } errorHandler: { (error) in
            
        } resultScreenHandler: { (finalText) in
            self.resultText.text = finalText
        }

    }
    
}

