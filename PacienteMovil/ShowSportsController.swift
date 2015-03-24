//
//  ShowSportsController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowSportsController: UIViewController {
    
    
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var labelDescription1: UILabel!
    @IBOutlet weak var labelIntensity1: UILabel!
    @IBOutlet weak var labelPlace1: UILabel!
    @IBOutlet weak var labelClimate1: UILabel!
    @IBOutlet weak var labelHydration1: UILabel!
    
    @IBOutlet weak var labelDescription2: UILabel!
    @IBOutlet weak var labelIntensity2: UILabel!
    @IBOutlet weak var labelPlace2: UILabel!
    @IBOutlet weak var labelClimate2: UILabel!
    @IBOutlet weak var labelHydration2: UILabel!
    
    var patient: Patient?
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDescription1.text = ""
        labelIntensity1.text = ""
        labelPlace1.text = ""
        labelClimate1.text = ""
        labelHydration1.text = ""
        
        labelDescription2.text = ""
        labelIntensity2.text = ""
        labelPlace2.text = ""
        labelClimate2.text = ""
        labelHydration2.text = ""
        
        if patient != nil {
            if episode != nil {
                
                let sports = episode!.sports
                episodeLabel.text = episode!.date
                
                if (sports.count >= 2)
                {
                    let firstSport = sports[0]
                    
                    labelDescription1.text = "Description: \(firstSport.description.description)"
                    labelIntensity1.text = "Intensity: \(firstSport.intensity.description)"
                    labelPlace1.text = "Place: \(firstSport.place.description)"
                    labelClimate1.text = "Climate: \(firstSport.climate.description)"
                    labelHydration1.text = "Hydration: \(firstSport.hydration.description)"
                    
                    let secondSport = sports[1]
                    
                    labelDescription2.text = "Description: \(secondSport.description.description)"
                    labelIntensity2.text = "Intensity: \(secondSport.intensity.description)"
                    labelPlace2.text = "Place: \(secondSport.place.description)"
                    labelClimate2.text = "Climate: \(secondSport.climate.description)"
                    labelHydration2.text = "Hydration: \(secondSport.hydration.description)"
                }
                else if (sports.count == 1)
                {
                    let firstSport = sports[0]
                    
                    labelDescription1.text = firstSport.description.description
                    labelIntensity1.text = firstSport.intensity.description
                    labelPlace1.text = firstSport.place.description
                    labelClimate1.text = firstSport.climate.description
                    labelHydration1.text = firstSport.hydration.description
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}