//
//  AddEpisodeNormalController.swift
//  PacienteMovil
//
//  Created by clau on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddEpisodeNormalController: UIViewController {
    
    var patient: Patient?
    
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientIDLabel: UILabel!
    
    @IBOutlet weak var episodeDateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var strengthTextField: UITextField!
    @IBOutlet weak var timeSleptTextField: UITextField!
    @IBOutlet weak var sleepingCycleTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var stressEpisodeTextField: UITextField!
    
    var date: NSDate = NSDate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        patientNameLabel.text = patient!.name
        patientIDLabel.text = patient!.id
        
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var episodeDate = dateFormatter.stringFromDate(date)
        
        episodeDateLabel.text = episodeDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addSymptomSegue" {
            
            if strengthTextField.text != "" && timeSleptTextField.text != "" && sleepingCycleTextField.text != "" && placeTextField.text != "" && stressEpisodeTextField.text != "" {
                if let strength = strengthTextField.text.toInt() {
                    if let timeSlept = timeSleptTextField.text.toInt(){
                        if let sleepingCycle = sleepingCycleTextField.text.toInt(){
                            if let place = placeTextField.text.toInt(){
                                if let stress = stressEpisodeTextField.text.toInt(){
                                    
                                    var normalSleepingCycle = false
                                    if sleepingCycle == 1 {
                                        normalSleepingCycle = true
                                    }
                                    
                                    var stressEpisode = false
                                    if stress == 1 {
                                        stressEpisode = true
                                    }
                                    
                                    var dateFormatter = NSDateFormatter()
                                    
                                    //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
                                    dateFormatter.dateFormat = "yyyy-MM-dd"
                                    
                                    var episodeDate = dateFormatter.stringFromDate(date)
                                    
                                    var episode = Episode(date: episodeDate, strength: strength, timeSlept: timeSlept, normalSleepingCycle: normalSleepingCycle, place: place, stress: stressEpisode, patientId: patient!.id)
                                    
                                    let addSympthomViewController = segue.destinationViewController as! AddSymptomController
                                    addSympthomViewController.episode = episode
                                    addSympthomViewController.patient = patient!
                                    println(addSympthomViewController.episode)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @IBAction func addSymptoms(sender: AnyObject) {
        
        if patient != nil {
                performSegueWithIdentifier("addSymptomSegue", sender: sender)
        }
    }
    
    
}
    