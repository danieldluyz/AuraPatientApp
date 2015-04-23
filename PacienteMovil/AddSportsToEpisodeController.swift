//
//  AddSportsToEpisodeController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddSportsToEpisodeController: UIViewController,  UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var patient: Patient?
    var episode: Episode?
    var tag: Int = 1
    
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
    
    @IBOutlet weak var sportPicker: UIPickerView!
    
    let sports = ["No activity", "American Football", "Baseball", "Basketball", "Bowling",
        "Football", "Dancing", "Football", "Golf", "Hockey", "Ping-Pong",
        "Rugby", "Running", "Swimming", "Tennis", "Volleyball", "Walking", "Other"]
    
    let trueorfalse = ["False", "True"]
    
    let climate = ["Sunny", "Partly sunny", "Cloudy", "Raining", "Thunderstorm", "Snowing"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sportDescriptionLabel1.delegate = self
        sportDescriptionLabel2.delegate = self
        sportIntensity1.delegate = self
        sportIntensity2.delegate = self
        sportClimate1.delegate = self
        sportClimate2.delegate = self
        sportHydration1.delegate = self
        sportHydration2.delegate = self
        
        sportDescriptionLabel1.text = sports[0]
        sportDescriptionLabel2.text = sports[0]
        sportIntensity1.text = trueorfalse[0]
        sportIntensity2.text = trueorfalse[0]
        sportClimate1.text = climate[0]
        sportClimate2.text = climate[0]
        sportHydration1.text = trueorfalse[0]
        sportHydration2.text = trueorfalse[0]
        
        sportPicker.delegate = self
        sportPicker.dataSource = self
        sportPicker.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addEpisode" {
            
            if sportDescriptionLabel1.text != sports[0] && sportIntensity1.text != "" && sportPlace1.text != "" && sportClimate1.text != climate[0] && sportHydration1.text != ""
            {
                if let description = find(sports, sportDescriptionLabel1.text) {
                    if let intensity = find(trueorfalse, sportDescriptionLabel1.text) {
                        if let place = sportPlace1.text.toInt(){
                            if let climate = find(climate, sportClimate1.text){
                                if let hydration = find(trueorfalse, sportHydration1.text){
                                    
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
            
            if sportDescriptionLabel2.text != sports[0] && sportIntensity2.text != "" && sportPlace2.text != "" && sportClimate2.text != climate[0] && sportHydration2.text != ""
            {
                if let description = find(sports, sportDescriptionLabel2.text) {
                    if let intensity = find(trueorfalse, sportIntensity2.text) {
                        if let place = sportPlace2.text.toInt(){
                            if let climate = find(climate, sportClimate2.text){
                                if let hydration = find(trueorfalse, sportHydration2.text){
                                    
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
                
                var encriptador: Security = Security()
                var tokenEncriptado = encriptador.encriptando(patient!.token)
                
                request.addValue("\(tokenEncriptado)", forHTTPHeaderField: "auth-token")
                
                request.HTTPBody = dataObject
                
                
                var response: NSURLResponse?
                //let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
                //println(dataObject)
                //let task = NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: dataObject)
                //task.resume()
                
                var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
                
                if let httpResponse = response as? NSHTTPURLResponse {
                    println("error \(httpResponse.statusCode)")
                    
                    let notificationDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSDictionary
                    
                    println(notificationDictionary)
                    
                    let notification = Notification(sportDictionary: notificationDictionary, episode: episode!)
                    episode!.notification = notification
                    
                    println(notificationDictionary)
                    
                    let showNotificationsController = segue.destinationViewController as! ShowNotificationsController
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (tag == 1 || tag == 2){
            return self.sports.count
        }
        else if (tag == 3 || tag == 4){
            return self.trueorfalse.count
        }
        else if (tag == 5 || tag == 6){
            return self.climate.count
        }
        else if (tag == 7 || tag == 8){
            return self.trueorfalse.count
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        if (tag == 1 || tag == 2){
            return self.sports[row]
        }
        else if (tag == 3 || tag == 4){
            return self.trueorfalse[row]
        }
        else if (tag == 5 || tag == 6){
            return self.climate[row]
        }
        else if (tag == 7 || tag == 8){
            return self.trueorfalse[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(tag == 1){
            self.sportDescriptionLabel1.text = self.sports[row];
            sportPicker.hidden = true
        }
        else if(tag == 2){
            self.sportDescriptionLabel2.text = self.sports[row];
            sportPicker.hidden = true
        }
        else if(tag == 3){
            self.sportIntensity1.text = self.trueorfalse[row];
            sportPicker.hidden = true
        }
        else if(tag == 4){
            self.sportIntensity2.text = self.trueorfalse[row];
            sportPicker.hidden = true
        }
        else if(tag == 5){
            self.sportClimate1.text = self.climate[row];
            sportPicker.hidden = true
        }
        else if(tag == 6){
            self.sportClimate2.text = self.climate[row];
            sportPicker.hidden = true
        }
        else if(tag == 7){
            self.sportHydration1.text = self.trueorfalse[row];
            sportPicker.hidden = true
        }
        else if(tag == 8){
            self.sportHydration2.text = self.trueorfalse[row];
            sportPicker.hidden = true
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if(textField.tag == 1){
            tag = 1
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 2){
            tag = 2
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 3){
            tag = 3
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 4){
            tag = 4
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 5){
            tag = 5
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 6){
            tag = 6
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 7){
            tag = 7
            sportPicker.reloadAllComponents()
        }
        else if(textField.tag == 8){
            tag = 8
            sportPicker.reloadAllComponents()
        }
        
        sportPicker.hidden = false
        
        return false
    }
    
}
