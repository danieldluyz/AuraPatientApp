//
//  EpisodeDetailViewController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episode: Episode?
    var patient: Patient?
    
    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var patientNameID: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var timeSleptLabel: UILabel!
    @IBOutlet weak var sleepingCycleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var stressLabel: UILabel!
    
    override func viewDidLoad() {

        if patient != nil {
            if episode != nil {
                
                patientNameLabel.text = patient!.name
                patientNameID.text = patient!.id
                
                //var dateFormatter = NSDateFormatter()
                //dateFormatter.dateFormat = "yyyy-MM-dd"
                //var strDate = dateFormatter.stringFromDate(episode!.date)
                dateLabel.text = episode!.date
                
                strengthLabel.text = episode!.strength.description
                timeSleptLabel.text = episode!.timeSlept.description
                sleepingCycleLabel.text = episode!.normalSleepingCycle.description
                placeLabel.text = episode!.place.description
                stressLabel.text = episode!.stress.description
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if segue.identifier == "showSymptoms" {
                let symptomViewController = segue.destinationViewController as ShowSymptomController
                symptomViewController.patient = patient
                symptomViewController.episode = episode
            }
            if segue.identifier == "showSports" {
                let sportsViewController = segue.destinationViewController as ShowSportsController
                sportsViewController.patient = patient
                sportsViewController.episode = episode
            }
        }
        
    }
    
    
    @IBAction func showSymptoms(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showSymptoms", sender: sender)
            }
        }
    }
    
    @IBAction func showSports(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showSports", sender: sender)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
