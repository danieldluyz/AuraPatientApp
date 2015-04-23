//
//  ShowNotificationsController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 25/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowNotificationsController: UIViewController {
    
    var patient: Patient?
    var episode: Episode?
    
    var labels: [UILabel] = []
    
    
    @IBOutlet weak var firstNotificationLabel: UILabel!
    @IBOutlet weak var secondNotificationLabel: UILabel!
    @IBOutlet weak var thirdNotificationLabel: UILabel!
    @IBOutlet weak var fourthNotificationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        firstNotificationLabel.text = ""
        secondNotificationLabel.text = ""
        thirdNotificationLabel.text = ""
        fourthNotificationLabel.text = ""
        
        labels.append(firstNotificationLabel)
        labels.append(secondNotificationLabel)
        labels.append(thirdNotificationLabel)
        labels.append(fourthNotificationLabel)
        
        if patient != nil {
            if episode != nil {
                
                let notification = episode!.notification
                
                firstNotificationLabel.text = notification!.message
                secondNotificationLabel.text = notification!.stress
                thirdNotificationLabel.text = notification!.sleepTime
                fourthNotificationLabel.text = notification!.intensity
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBackHome(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                
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

                performSegueWithIdentifier("goBackHome", sender: sender)
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if episode != nil {
                if segue.identifier == "goBackHome" {
                    
                    let patientViewController = segue.destinationViewController as! PatientViewController
                    patientViewController.patient = patient
                }
            }
        }
    }
    
    
    
}
