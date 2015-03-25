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
                                }
                            }
                        }
                    }
                }
            }
            println(episode!)
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
