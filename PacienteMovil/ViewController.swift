//
//  ViewController.swift
//  PacienteMovil
//
//  Created by Aura on 3/22/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getPatient" {
            
            let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/")
            let patientURL = NSURL(string: textID.text, relativeToURL: baseURL)
            
            
            let dataObject = NSData(contentsOfURL: patientURL!)
            let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
            
            println(patientDictionary)
            
            let currentPatient = Patient(patientDictionary: patientDictionary)
            let patientViewController = segue.destinationViewController as PatientViewController
            patientViewController.patient = currentPatient
            currentPatient.id = textID.text
        }
    
        
    }

}

