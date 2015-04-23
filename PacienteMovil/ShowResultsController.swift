//
//  ShowResultsController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowResultsController: UIViewController {
    
    @IBOutlet weak var buttonEpisode1: UIButton!
    @IBOutlet weak var buttonEpisode2: UIButton!
    @IBOutlet weak var buttonEpisode3: UIButton!
    @IBOutlet weak var buttonEpisode4: UIButton!
    @IBOutlet weak var buttonEpisode5: UIButton!
    @IBOutlet weak var buttonEpisode6: UIButton!
    @IBOutlet weak var buttonEpisode7: UIButton!
    @IBOutlet weak var buttonEpisode8: UIButton!
    @IBOutlet weak var buttonEpisode9: UIButton!
    @IBOutlet weak var buttonEpisode10: UIButton!
    
    var patient: Patient?
    var episodes: [Episode]?
    
    var episodeButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        buttonEpisode1.setTitle("", forState: UIControlState.Normal)
        buttonEpisode2.setTitle("", forState: UIControlState.Normal)
        buttonEpisode3.setTitle("", forState: UIControlState.Normal)
        buttonEpisode4.setTitle("", forState: UIControlState.Normal)
        buttonEpisode5.setTitle("", forState: UIControlState.Normal)
        buttonEpisode6.setTitle("", forState: UIControlState.Normal)
        buttonEpisode7.setTitle("", forState: UIControlState.Normal)
        buttonEpisode8.setTitle("", forState: UIControlState.Normal)
        buttonEpisode9.setTitle("", forState: UIControlState.Normal)
        buttonEpisode10.setTitle("", forState: UIControlState.Normal)
        
        buttonEpisode1.enabled = false
        buttonEpisode2.enabled = false
        buttonEpisode3.enabled = false
        buttonEpisode4.enabled = false
        buttonEpisode5.enabled = false
        buttonEpisode6.enabled = false
        buttonEpisode6.enabled = false
        buttonEpisode7.enabled = false
        buttonEpisode8.enabled = false
        buttonEpisode9.enabled = false
        buttonEpisode10.enabled = false
        
        episodeButtons.append(buttonEpisode1)
        episodeButtons.append(buttonEpisode2)
        episodeButtons.append(buttonEpisode3)
        episodeButtons.append(buttonEpisode4)
        episodeButtons.append(buttonEpisode5)
        episodeButtons.append(buttonEpisode6)
        episodeButtons.append(buttonEpisode7)
        episodeButtons.append(buttonEpisode8)
        episodeButtons.append(buttonEpisode9)
        episodeButtons.append(buttonEpisode10)
        
        if patient != nil {
            if episodes != nil {
               
                for var index = 0; index < episodes!.count; index++ {
                    
                    if (index < 10)
                    {
                        let button = episodeButtons[index]
                        let episode = episodes![index]
                        
                        button.setTitle(episode.date, forState: UIControlState.Normal)
                        button.enabled = true
                        
                    }
                    else
                    {
                        break
                    }
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showEpisodeDetails(sender: AnyObject) {
        if patient != nil {
            if episodes != nil {
                performSegueWithIdentifier("showEpisodeDetails", sender: sender)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if episodes != nil {
                if segue.identifier == "showEpisodeDetails" {
                    
                    let index: Int = sender!.tag - 1
                    
                    let episode = episodes![index]
                    
                    let episodeDetailsViewController = segue.destinationViewController as! EpisodeDetailViewController
                    episodeDetailsViewController.patient = patient
                    episodeDetailsViewController.episode = episode
                    
                }
            }
        }
    }
}
