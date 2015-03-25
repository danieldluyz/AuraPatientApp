//
//  AddMedicinesToEpisodeController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddMedicinesToEpisodeController: UIViewController {
    
    var patient: Patient?
    var episode: Episode?
    
    
    @IBOutlet weak var medicineName1: UITextField!
    @IBOutlet weak var medicineQuantity1: UITextField!
    
    
    @IBOutlet weak var medicineName2: UITextField!
    @IBOutlet weak var medicineQuantity2: UITextField!
    
    
    @IBOutlet weak var medicineName3: UITextField!
    @IBOutlet weak var medicineQuantity3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addSports" {
            
            if medicineName1.text != "" && medicineQuantity1.text != ""
            {
                if let quantity = medicineQuantity1.text.toInt() {
                    let newMedicine = Medicine(name: medicineName1.text, hoursAgo: quantity, episode: episode!)
                    episode!.medicines.append(newMedicine)
                }
            }
            
            if medicineName2.text != "" && medicineQuantity2.text != ""
            {
                if let quantity = medicineQuantity2.text.toInt() {
                    let newMedicine = Medicine(name: medicineName2.text, hoursAgo: quantity, episode: episode!)
                    episode!.medicines.append(newMedicine)
                }
            }
            
            if medicineName3.text != "" && medicineQuantity3.text != ""
            {
                if let quantity = medicineQuantity3.text.toInt() {
                    let newMedicine = Medicine(name: medicineName3.text, hoursAgo: quantity, episode: episode!)
                    episode!.medicines.append(newMedicine)
                }
            }
            
            let addSportsController = segue.destinationViewController as AddSportsToEpisodeController
            addSportsController.patient = patient
            addSportsController.episode = episode
            
        }
    }
    
    @IBAction func addSports(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("addSports", sender: sender)
            }
        }
    }
    
}
