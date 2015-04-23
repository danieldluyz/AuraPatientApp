//
//  AddSymptomController.swift
//  PacienteMovil
//
//  Created by Sebastian Valencia on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddSymptomController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var patient: Patient?
    var episode: Episode?
    
    var tag: Int = 0
    
    @IBOutlet weak var symptomTextField1: UITextField!
    @IBOutlet weak var symptomTextField2: UITextField!
    @IBOutlet weak var symptomTextField3: UITextField!
    @IBOutlet weak var symptomTextField4: UITextField!
    @IBOutlet weak var symptomTextField5: UITextField!
    
    @IBOutlet weak var symptomPicker: UIPickerView!
    
    let symptoms = ["Select", "Depression, irritability or excitement", "Lack of restful sleep", "Stuffy eyes or watery eyes", "Cravings",
        "Throbbing pain on one or both sides of the head", "Eye pain", "Neck pain", "Frequent urinaton", "Yawning", "Numbness or tingling",
        "Nausea or vomitting", "Light, noise or smells worsen pain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        symptomPicker.delegate = self
        symptomPicker.dataSource = self
        symptomPicker.hidden = true
        
        symptomTextField1.delegate = self
        symptomTextField2.delegate = self
        symptomTextField3.delegate = self
        symptomTextField4.delegate = self
        symptomTextField5.delegate = self
        
        symptomTextField1.text = symptoms[0]
        symptomTextField2.text = symptoms[0]
        symptomTextField3.text = symptoms[0]
        symptomTextField4.text = symptoms[0]
        symptomTextField5.text = symptoms[0]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addEpisodeFoods" {
    
            if (symptomTextField1.text != symptoms[0])
            {
                if let symptom = find(symptoms, symptomTextField1.text) {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField2.text != symptoms[0])
            {
                if let symptom = find(symptoms, symptomTextField2.text) {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField3.text != symptoms[0])
            {
                if let symptom = find(symptoms, symptomTextField3.text) {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField4.text != symptoms[0])
            {
                if let symptom = find(symptoms, symptomTextField4.text) {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
            
            if (symptomTextField5.text != symptoms[0])
            {
                if let symptom = find(symptoms, symptomTextField5.text) {
                    let newSymptom = Symptom(symptom: symptom, episode: episode!)
                    episode!.symptoms.append(newSymptom)
                }
            }
           
            let addFoodController = segue.destinationViewController as! AddFoodToEpisodeController
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.symptoms.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return self.symptoms[row];
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(tag == 1){
            self.symptomTextField1.text = self.symptoms[row];
            symptomPicker.hidden = true
        }
        else if(tag == 2){
            self.symptomTextField2.text = self.symptoms[row];
            symptomPicker.hidden = true
        }
        else if(tag == 3){
            self.symptomTextField3.text = self.symptoms[row];
            symptomPicker.hidden = true
        }
        else if(tag == 4){
            self.symptomTextField4.text = self.symptoms[row];
            symptomPicker.hidden = true
        }
        else if(tag == 5){
            self.symptomTextField5.text = self.symptoms[row];
            symptomPicker.hidden = true
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if(textField.tag == 1){
            tag = 1
        }
        else if(textField.tag == 2){
            tag = 2
        }
        else if(textField.tag == 3){
            tag = 3
        }
        else if(textField.tag == 4){
            tag = 4
        }
        else if(textField.tag == 5){
            tag = 5
        }
        
        symptomPicker.hidden = false
        
        return false
    }
    
}