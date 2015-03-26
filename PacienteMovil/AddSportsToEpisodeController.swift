//
//  AddSportsToEpisodeController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddSportsToEpisodeController: UIViewController {
    
    var patient: Patient?
    var episode: Episode?
    
    @IBOutlet weak var sportDescriptionLabel1: UITextField!
    @IBOutlet weak var sportIntensity1: UITextField!
    @IBOutlet weak var sportPlace1: UITextField!
    @IBOutlet weak var sportClimate1: UITextField!
    @IBOutlet weak var sportHydration1: UITextField!
    
    
    @IBOutlet weak var sportDescriptionLabel2: UITextField!
    @IBOutlet weak var sportIntensity2: UITextField!
    @IBOutlet weak var sportPlace2: UITextField!
    @IBOutlet weak var sportClimate2: UITextField!
    @IBOutlet weak var sportHydration2: UITextField!
    
    let net = Net()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addEpisode" {
            
            if sportDescriptionLabel1.text != "" && sportIntensity1.text != "" && sportPlace1.text != "" && sportClimate1.text != "" && sportHydration1.text != ""
            {
                if let description = sportDescriptionLabel1.text.toInt() {
                    if let intensity = sportIntensity1.text.toInt(){
                        if let place = sportPlace1.text.toInt(){
                            if let climate = sportClimate1.text.toInt(){
                                if let hydration = sportHydration1.text.toInt(){
                                    
                                    var hydrationText = false
                                    if hydration == 1 {
                                        hydrationText = true
                                    }
                                    
                                    let newSport = Sport(description: description, intensity: intensity, place: place, climate: climate, hydration: hydrationText, episode: episode!)
                                    episode!.sports.append(newSport)
                                    println("**********")
                                }
                            }
                        }
                    }
                }
            }
            
            if sportDescriptionLabel2.text != "" && sportIntensity2.text != "" && sportPlace2.text != "" && sportClimate2.text != "" && sportHydration2.text != ""
            {
                if let description = sportDescriptionLabel2.text.toInt() {
                    if let intensity = sportIntensity2.text.toInt(){
                        if let place = sportPlace2.text.toInt(){
                            if let climate = sportClimate2.text.toInt(){
                                if let hydration = sportHydration2.text.toInt(){
                                    
                                    var hydrationText = false
                                    if hydration == 1 {
                                        hydrationText = true
                                    }
                                    
                                    let newSport = Sport(description: description, intensity: intensity, place: place, climate: climate, hydration: hydrationText, episode: episode!)
                                    episode!.sports.append(newSport)
                                    println("**********")
                                }
                            }
                        }
                    }
                }
            }
            
            
            //let dataObject: NSData = episode!.toJson()
            
            //let episodeDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSDictionary
            
            //println("***!!!***")
            //println(episode!)
            
            println("-------!!!!!!-------")
            println(episode!.toDictionary())
            println("-------!!!!!!-------")
            
            
            
            if NSJSONSerialization.isValidJSONObject(episode!.toDictionary()) {
                var err: NSError?
                
                let dataObject: NSData = NSJSONSerialization.dataWithJSONObject(episode!.toDictionary(), options: nil, error: &err)!
                
                println("--------------")
                println(episode!.stress)
                
                let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/\(patient!.id)/episode")
                
                let request = NSMutableURLRequest(URL: baseURL!)
                request.HTTPMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.HTTPBody = dataObject
                
                
                var response: NSURLResponse?
                //let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
                //println(dataObject)
                //let task = NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: dataObject)
                //task.resume()
                
                var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
                
                if let httpResponse = response as? NSHTTPURLResponse {
                    println("error \(httpResponse.statusCode)")
                    
                    let notificationDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
                    
                    println(notificationDictionary)
                    
                    let notification = Notification(sportDictionary: notificationDictionary, episode: episode!)
                    episode!.notification = notification
                    
                    println(notificationDictionary)
                    
                    let showNotificationsController = segue.destinationViewController as ShowNotificationsController
                    showNotificationsController.patient = patient!
                    showNotificationsController.episode = episode!
                }
                
            }
        }
    }
    
    @IBAction func addEpisode(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("addEpisode", sender: sender)
            }
        }
    }
    
}
