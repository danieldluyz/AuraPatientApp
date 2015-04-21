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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(segue:UIStoryboardSegue) {
        var source = segue.sourceViewController as PatientViewController
        source.patient = nil
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getPatient" {
            
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
                    
                    println(httpResponse.description)
                    println("aura-token")
                    println("Código: \(httpResponse.statusCode)")
                    
                    var etag = httpResponse.allHeaderFields["Etag"] as? String
                    
                    let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary

                    println(patientDictionary)
                    
                    if patientDictionary.count > 0 {
                        
                        let currentPatient = Patient(patientDictionary: patientDictionary)
                        let patientViewController = segue.destinationViewController as PatientViewController
                        patientViewController.patient = currentPatient
                        currentPatient.id = textID.text
                        currentPatient.token = etag!
                        println(currentPatient)
                    }
                }
                
            }
        }
    }
}
