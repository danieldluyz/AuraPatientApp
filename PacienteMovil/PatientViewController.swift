//
//  PacientViewController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class PatientViewController: UIViewController {
    
    @IBOutlet weak var patientNameLabel: UILabel!
    
    @IBOutlet weak var labelEpisode1: UIButton!
    @IBOutlet weak var labelEpisode2: UIButton!
    @IBOutlet weak var labelEpisode3: UIButton!
    @IBOutlet weak var labelEpisode4: UIButton!
    @IBOutlet weak var labelEpisode5: UIButton!
    
    var episodeButtons: [UIButton] = []
    
    var patient: Patient?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        labelEpisode1.setTitle("", forState: UIControlState.Normal)
        labelEpisode2.setTitle("", forState: UIControlState.Normal)
        labelEpisode3.setTitle("", forState: UIControlState.Normal)
        labelEpisode4.setTitle("", forState: UIControlState.Normal)
        labelEpisode5.setTitle("", forState: UIControlState.Normal)
        
        labelEpisode1.enabled = false
        labelEpisode2.enabled = false
        labelEpisode3.enabled = false
        labelEpisode4.enabled = false
        labelEpisode5.enabled = false
        
        episodeButtons.append(labelEpisode1)
        episodeButtons.append(labelEpisode2)
        episodeButtons.append(labelEpisode3)
        episodeButtons.append(labelEpisode4)
        episodeButtons.append(labelEpisode5)
        
        if patient != nil {

            patientNameLabel.text = patient!.name
            
            let episodes = patient!.episodes
            var number = 0
            
            for var index = episodes.count-1; index >= 0; index-- {
                
                if (number < 5)
                {
                    let button = episodeButtons[number]
                    let episode = episodes[index]
                    
                    button.setTitle(episode.date, forState: UIControlState.Normal)
                    button.enabled = true
                    number++
                }
                else
                {
                    break
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if segue.identifier == "showEpisodeDetails" {
                
                let episodes = patient!.episodes
                
                let index: Int = sender!.tag
                let count = episodes.count
                
                let episode = episodes[count-index]
                
                let episodeDetailsViewController = segue.destinationViewController as EpisodeDetailViewController
                episodeDetailsViewController.patient = patient
                episodeDetailsViewController.episode = episode
                
            }
            else if segue.identifier == "searchBetweenDates" {
                let searchViewController = segue.destinationViewController as SearchController
                searchViewController.patient = patient!
            }
            
            else if segue.identifier == "addNewEpisodeRegular" {
                let addViewController = segue.destinationViewController as AddEpisodeNormalController
                addViewController.patient = patient!
            }
            
            else if segue.identifier == "audioSegue" {
                
                println("yyyyyyyyyyyy")
                let aViewController = segue.destinationViewController as AudioViewController
                aViewController.patient = patient!
            }
            
            else if segue.identifier == "logout" {
                
                let viewController = segue.destinationViewController as ViewController
            }
        }
        
    }

    @IBAction func showEpisode(sender: AnyObject) {
        
        if patient != nil {
            performSegueWithIdentifier("showEpisodeDetails", sender: sender)
        }
    }
    
    @IBAction func recordAudioN(sender: AnyObject) {
        
        if patient != nil {
            println("aaaaaaaaaa")
            performSegueWithIdentifier("audioSegue", sender: sender)
        }
    }
    
    @IBAction func searchBetweenDates(sender: AnyObject) {
        
        if patient != nil {
            performSegueWithIdentifier("searchBetweenDates", sender: sender)
        }
    }
    
  
    @IBAction func addNewEpisodeRegular(sender: AnyObject) {
        if patient != nil {
            performSegueWithIdentifier("addNewEpisodeRegular", sender: sender)
        }
    }
    
}
