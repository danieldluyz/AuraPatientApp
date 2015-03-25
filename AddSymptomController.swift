//
//  AddSymptomController.swift
//  PacienteMovil
//
//  Created by Sebastian Valencia on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddSymptomController: UIViewController {
    
    var patient: Patient?
    var episode: Episode?
    
    @IBOutlet weak var symptomTextField1: UITextField!
    @IBOutlet weak var symptomTextField2: UITextField!
    @IBOutlet weak var symptomTextField3: UITextField!
    @IBOutlet weak var symptomTextField4: UITextField!
    @IBOutlet weak var symptomTextField5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addEpisodeFoods" {
    
            if (symptomTextField1.text != "")
            {
                if let symptom = symptomTextField1.text.toInt() {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField2.text != "")
            {
                if let symptom = symptomTextField2.text.toInt() {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField3.text != "")
            {
                if let symptom = symptomTextField3.text.toInt() {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField4.text != "")
            {
                if let symptom = symptomTextField4.text.toInt() {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField5.text != "")
            {
                if let symptom = symptomTextField5.text.toInt() {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
           
            let addFoodController = segue.destinationViewController as AddFoodToEpisodeController
            addFoodController.patient = patient
            addFoodController.episode = episode
            
            
        }
    }
    
    @IBAction func addFoods(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("addEpisodeFoods", sender: sender)   
            }
        }
    }
    
}