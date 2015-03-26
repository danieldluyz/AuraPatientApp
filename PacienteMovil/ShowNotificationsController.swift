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
                //performSegueWithIdentifier("goBackHome", sender: sender)
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if episode != nil {
                if segue.identifier == "goBackHome" {
                    
                    //let patientViewController = segue.destinationViewController as PatientViewController
                    //patientViewController.patient = patient
                }
            }
        }
    }
    
    
    
}
