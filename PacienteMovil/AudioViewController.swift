//
//  AudioViewController.swift
//  PacienteMovil
//
//  Created by Sebastian Valencia on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import UIKit
import AVFoundation
class AudioViewController: UIViewController,AVAudioRecorderDelegate {
    
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    
    var patient: Patient!
    var filePath: String?
    
    @IBOutlet weak var recordlabel: UIButton!
    @IBOutlet weak var stopButt: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recordingInProgress.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButt.hidden = true
        recordlabel.enabled = true
    }
    
    @IBAction func recordAudio(sender: AnyObject) {
        stopButt.hidden = false
        recordingInProgress.hidden = false
        recordlabel.enabled = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = "grabacion.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        self.filePath = dirPath
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else {
            println("Recording was not successful")
            recordlabel.enabled = true
            stopButt.hidden = true
            
           
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecording"){
            
                
                
                let playSoundsVC: DoneViewController = segue.destinationViewController as DoneViewController
                
                let data = sender as RecordedAudio
                playSoundsVC.recivedAudio = data

        }
    }
    
    
    @IBAction func stopButton(sender: AnyObject) {
        recordingInProgress.hidden = true
        stopButt.enabled = false
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
        
        if let f = filePath? {
            
            let url = "http://aura-app.herokuapp.com/api"
            
            //        var p = SRWebClient.GET(url + "/doctor",
            //            success: {(response:AnyObject!, status:Int) -> Void in
            //                let headersJSON = response! as NSArray
            //                println("Hola: \(headersJSON)")
            //        },failure: {(error:NSError!) -> Void in
            //                println(error!.code)
            //        })
            
            let net = Net()
            //        var parames : NSDictionary = ["hola" : "hola"]
            //        net.GET(url + "/doctor", params: nil, successHandler: { responseData in
            //            let data : NSData = responseData.data
            //            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            //
            //            let jsonResult : NSArray = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error:error) as NSArray
            //
            //            }, failureHandler: { error in
            //                NSLog("Error")
            //        })
            
    
            let sound : NSData = NSData(contentsOfFile: filePath!+"/grabacion.wav")!
            //
            //        let params = ["upload": NetData(data: sound, mimeType: MimeType(rawValue:"audio/ogg")!, filename: "sebastian.wav")]
            //
            //        net.POST(url + "/", params: params, successHandler: { responseData in
            //            let result = responseData.json(error: nil)
            //            NSLog("result: \(result)")
            //            }, failureHandler: { error in
            //                NSLog("Error")
            //        })
            
            //        let image = UIImage(named: "salasEstudioImg")
            //        let imageData = UIImagePNGRepresentation(image)
            
            //        let params = ["upload": NetData(pngImage: img, filename: "myIcon.png")]
            
            
            let params = ["upload": NetData(data: sound, mimeType: MimeType.Json, filename: "temp.wav")]
            
            net.POST(url + "/patient/\(patient!.id)/voice_episode", params: params, successHandler: { responseData in
                let result = responseData.json(error: nil)
                NSLog("result: \(result)")
                }, failureHandler: { error in
                    NSLog("Error")
            })
        }
        
        
    }
}


