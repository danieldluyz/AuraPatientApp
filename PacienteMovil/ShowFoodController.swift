//
//  ShowFoodController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class ShowFoodController: UIViewController {
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var foodLabel1: UILabel!
    @IBOutlet weak var foodLabel2: UILabel!
    @IBOutlet weak var foodLabel3: UILabel!
    @IBOutlet weak var foodLabel4: UILabel!
    @IBOutlet weak var foodLabel5: UILabel!
    
    
    @IBOutlet weak var foodQuantity1: UILabel!
    @IBOutlet weak var foodQuantity2: UILabel!
    @IBOutlet weak var foodQuantity3: UILabel!
    @IBOutlet weak var foodQuantity4: UILabel!
    @IBOutlet weak var foodQuantity5: UILabel!
    
    var patient: Patient?
    var episode: Episode?
    
    var foodLabels: [UILabel] = []
    var foodQuantities: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodLabel1.text = ""
        foodLabel2.text = ""
        foodLabel3.text = ""
        foodLabel4.text = ""
        foodLabel5.text = ""
        
        foodLabels.append(foodLabel1)
        foodLabels.append(foodLabel2)
        foodLabels.append(foodLabel3)
        foodLabels.append(foodLabel4)
        foodLabels.append(foodLabel5)
        
        foodQuantity1.text = ""
        foodQuantity2.text = ""
        foodQuantity3.text = ""
        foodQuantity4.text = ""
        foodQuantity5.text = ""
        
        foodQuantities.append(foodQuantity1)
        foodQuantities.append(foodQuantity2)
        foodQuantities.append(foodQuantity3)
        foodQuantities.append(foodQuantity4)
        foodQuantities.append(foodQuantity5)
        
        if patient != nil {
            if episode != nil {
                
                let foods = episode!.foods
                episodeLabel.text = episode!.date
                
                for var index = 0; index < foods.count; index++ {
                    
                    if (index < 5)
                    {
                        let name = foodLabels[index]
                        let quantity = foodQuantities[index]
                        let food = foods[index]
                        
                        name.text = food.name
                        quantity.text = food.quantity.description
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
