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
    @IBOutlet weak var passwordText: UITextField!
    
    var patient: Patient?
    var token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(segue:UIStoryboardSegue) {
        var source = segue.sourceViewController as! PatientViewController
        source.patient = nil
    }
    
    @IBAction func logIn(sender: AnyObject) {
        var dictionary = ["id": textID.text, "password": passwordText.text]
        
        if NSJSONSerialization.isValidJSONObject(dictionary) {
            
            var err: NSError?
            
            let dataObject: NSData = NSJSONSerialization.dataWithJSONObject(dictionary, options: nil, error: &err)!
            
            let baseURL = NSURL(string: "https://aura-app.herokuapp.com/patient/authenticate")
            
            let request = NSMutableURLRequest(URL: baseURL!)
            request.HTTPMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = dataObject
            
            
            var response: NSURLResponse?
            
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
            
            if let httpResponse = response as? NSHTTPURLResponse {
                
                token = httpResponse.allHeaderFields["Etag"] as? String
                
                let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSDictionary
                
                if patientDictionary.count > 0 {
                    patient = Patient(patientDictionary: patientDictionary)
                    patient!.id = textID.text
                    patient!.token = token!
                    
                    performSegueWithIdentifier("getPatient", sender: sender)
                }
                else {
                    textID.text = ""
                    passwordText.text = ""
                }
                
            }
            else {
                textID.text = ""
                passwordText.text = ""
            }
            
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getPatient" {
            
            let patientViewController = segue.destinationViewController as! PatientViewController
            patientViewController.patient = patient
            patient!.token = token!
        }
    }
}
