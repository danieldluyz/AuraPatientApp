//
//  ShowSymptomsController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 23/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowSymptomController: UIViewController {
    
    
    @IBOutlet weak var labelSymptom1: UILabel!
    @IBOutlet weak var labelSymptom2: UILabel!
    @IBOutlet weak var labelSymptom3: UILabel!
    @IBOutlet weak var labelSymptom4: UILabel!
    @IBOutlet weak var labelSymptom5: UILabel!
    
    @IBOutlet weak var labelEpisode: UILabel!
    
    var patient: Patient?
    var episode: Episode?
    
    var symtomsLabel: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSymptom1.text = ""
        labelSymptom2.text = ""
        labelSymptom3.text = ""
        labelSymptom4.text = ""
        labelSymptom5.text = ""
        
        symtomsLabel.append(labelSymptom1)
        symtomsLabel.append(labelSymptom2)
        symtomsLabel.append(labelSymptom3)
        symtomsLabel.append(labelSymptom4)
        symtomsLabel.append(labelSymptom5)
        
        if patient != nil {
            if episode != nil {
                
                let symptoms = episode!.symptoms
                labelEpisode.text = episode!.date
                
                for var index = 0; index < symptoms.count; index++ {
                    
                    if (index < 5)
                    {
                        let label = symtomsLabel[index]
                        let symptom = symptoms[index]
                        
                        label.text = symptom.symptom.description
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
}
