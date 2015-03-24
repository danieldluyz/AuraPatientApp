//
//  AddEpisodeNormalController.swift
//  PacienteMovil
//
//  Created by clau on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class AddEpisodeNormalController: UIViewController {
    var patient: Patient?
    
    @IBOutlet weak var h: UITextField!
    @IBOutlet weak var timeSleptxt: UITextField!
    @IBOutlet weak var placetxt: UITextField!
    @IBOutlet weak var stresstxt: UITextField!
    @IBOutlet weak var normalcycletxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("hhhhhhhhhhhhhhhh")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addSymptomSegue" {
            
            
            let addSympthomViewController = segue.destinationViewController as AddSymptomController
            addSympthomViewController.str = h.text
            addSympthomViewController.timesl = timeSleptxt.text
            addSympthomViewController.place =  placetxt.text
            addSympthomViewController.stress = stresstxt.text
            addSympthomViewController.normal = normalcycletxt.text
        }
        
        
    }

    @IBAction func addSymptoms(sender: AnyObject) {
        
        if patient != nil {
                performSegueWithIdentifier("addSymptomSegue", sender: sender)
            
        }
    }
    
    
}
    