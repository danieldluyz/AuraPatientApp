//
//  DoneViewController.swift
//  PacienteMovil
//
//  Created by Sebastian Valencia on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import UIKit
import AVFoundation

class DoneViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var listenbut: UIButton!
    
    @IBOutlet weak var stopbut: UIButton!
    var recivedAudio: RecordedAudio!
    var patient: Patient!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
        //   var file = NSURL.fileURLWithPath(filePath)
        
        
        // } else {
        //     println("the file is empty!!")
        //}
        audioPlayer = AVAudioPlayer(contentsOfURL: recivedAudio.filePathUrl, error: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAudio(sender: AnyObject) {
        audioPlayer.play()
        listenbut.enabled =  false
    }
    
    @IBAction func stopsound(sender: AnyObject) {
        audioPlayer.stop()
        listenbut.enabled = true
        
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goHome(sender: AnyObject) {
        
        var err: NSError?
        
        let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/\(patient!.id)")
        
        let request = NSMutableURLRequest(URL: baseURL!)
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var encriptador: Security = Security()
        var tokenEncriptado = encriptador.encriptando(patient!.token)
        
        request.addValue("\(tokenEncriptado)", forHTTPHeaderField: "auth-token")
        request.addValue("PAC", forHTTPHeaderField: "who")
        request.addValue("\(patient!.id)", forHTTPHeaderField: "id")
        
        var response: NSURLResponse?
        
        let id = patient!.id
        let token = patient!.token
        
        println(tokenEncriptado)
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
        
        
        if let httpResponse = response as? NSHTTPURLResponse {
            
            println(httpResponse)
            
            let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSDictionary
            
            if patientDictionary.count > 0 {
                patient = Patient(patientDictionary: patientDictionary)
                patient!.id = id
                patient!.token = token
                
            }
        }
        
        performSegueWithIdentifier("goHome", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goHome" {
                let patientViewController = segue.destinationViewController as! PatientViewController
                patientViewController.patient = patient
        }
    }
    
}

