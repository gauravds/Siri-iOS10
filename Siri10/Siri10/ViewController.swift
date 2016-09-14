//
//  ViewController.swift
//  Siri10
//
//  Created by Gaurav Sharma on 13/09/16.
//  Copyright © 2016 GDS. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet var recordButton: UIButton!
    @IBOutlet var txtView: UITextView!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] (allowed: Bool) -> Void in
                DispatchQueue.main.async {
                    if allowed {
                        
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
    }
    
    func startRecording() {
        let audioURL = URL(string: audioFileName!)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ] as [String : Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    public let audioFileName : String? = {
        return String(ViewController.getDocumentsDirectory().strings(byAppendingPaths: ["recording.m4a"])[0])
    }()

    class func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    func finishRecording(success: Bool) {
        audioRecorder?.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
            speechTest()
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    @IBAction func recordTapped() {
        speechTest()
        
        
//        if audioRecorder == nil {
//            startRecording()
//        } else {
//            finishRecording(success: true)
//        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    //MARK: Siri in build
    func speechTest() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "Guruvani", withExtension: "m4a") {
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            print (result?.bestTranscription.formattedString)
                            self.txtView.text = result?.bestTranscription.formattedString
                        }
                    })
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

