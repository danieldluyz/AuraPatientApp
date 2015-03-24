//
//  ShowMedicinesViewController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowMedicinesViewController: UIViewController {
    
    @IBOutlet weak var episodeLabel: UILabel!
    
   
    @IBOutlet weak var medicineLabel1: UILabel!
    @IBOutlet weak var medicineLabel2: UILabel!
    @IBOutlet weak var medicineLabel3: UILabel!
    @IBOutlet weak var medicineLabel4: UILabel!
    @IBOutlet weak var medicineLabel5: UILabel!
    
    @IBOutlet weak var medicineQuantity1: UILabel!
    @IBOutlet weak var medicineQuantity2: UILabel!
    @IBOutlet weak var medicineQuantity3: UILabel!
    @IBOutlet weak var medicineQuantity4: UILabel!
    @IBOutlet weak var medicineQuantity5: UILabel!
    
    var patient: Patient?
    var episode: Episode?
    
    var medicineNameLabels: [UILabel] = []
    var medicineQuantityLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicineLabel1.text = ""
        medicineLabel2.text = ""
        medicineLabel3.text = ""
        medicineLabel4.text = ""
        medicineLabel5.text = ""
        
        medicineNameLabels.append(medicineLabel1)
        medicineNameLabels.append(medicineLabel2)
        medicineNameLabels.append(medicineLabel3)
        medicineNameLabels.append(medicineLabel4)
        medicineNameLabels.append(medicineLabel5)
        
        medicineQuantity1.text = ""
        medicineQuantity2.text = ""
        medicineQuantity3.text = ""
        medicineQuantity4.text = ""
        medicineQuantity5.text = ""
        
        medicineQuantityLabels.append(medicineQuantity1)
        medicineQuantityLabels.append(medicineQuantity2)
        medicineQuantityLabels.append(medicineQuantity3)
        medicineQuantityLabels.append(medicineQuantity4)
        medicineQuantityLabels.append(medicineQuantity5)
        
        if patient != nil {
            if episode != nil {
                
                let medicines = episode!.medicines
                episodeLabel.text = episode!.date
                
                for var index = 0; index < medicines.count; index++ {
                    
                    if (index < 5)
                    {
                        let name = medicineNameLabels[index]
                        let quantity = medicineQuantityLabels[index]
                        let medicine = medicines[index]
                        
                        name.text = medicine.name
                        quantity.text = medicine.hoursAgo.description
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
