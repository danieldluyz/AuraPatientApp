//
//  AddFoodToEpisodeController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddFoodToEpisodeController: UIViewController {
    
    var episode: Episode?
    var patient: Patient?
    
    
    @IBOutlet weak var foodName1: UITextField!
    @IBOutlet weak var foodQuantity1: UITextField!
    
    
    @IBOutlet weak var foodName2: UITextField!
    @IBOutlet weak var foodQuantity2: UITextField!
    
    @IBOutlet weak var foodName3: UITextField!
    @IBOutlet weak var foodQuantity3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addMedicines" {
            
            if foodName1.text != "" && foodQuantity1.text != ""
            {
                if let quantity = foodQuantity1.text.toInt() {
                    let newFood = Food(name: foodName1.text, quantity: quantity, episode: episode!)
                    episode!.foods.append(newFood)
                }
            }
            
            if foodName2.text != "" && foodQuantity2.text != ""
            {
                if let quantity = foodQuantity2.text.toInt() {
                    let newFood = Food(name: foodName2.text, quantity: quantity, episode: episode!)
                    episode!.foods.append(newFood)

                }
            }
            
            if foodName3.text != "" && foodQuantity3.text != ""
            {
                if let quantity = foodQuantity3.text.toInt() {
                    let newFood = Food(name: foodName3.text, quantity: quantity, episode: episode!)
                    episode!.foods.append(newFood)
                }
            }
            
            let addMedicinesController = segue.destinationViewController as! AddMedicinesToEpisodeController
            addMedicinesController.patient = patient
            addMedicinesController.episode = episode
            
            
        }
    }
    
    
    
    @IBAction func addMedicines(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("addMedicines", sender: sender)
            }
        }
    }
    
    
}
