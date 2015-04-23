//
//  SearchController.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController  {
    
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        datePicker.addTarget(self, action: Selector("firstDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firstDatePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        
        //let toArray = strDate.componentsSeparatedByString("/")
        //let backToString = join("-", toArray)
        
        firstDateLabel.text = strDate
    }
    
    @IBAction func secondDatePicked(sender: AnyObject) {
       datePicker.removeTarget(self, action: Selector("firstDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
       secondDateLabel.text = firstDateLabel.text
       datePicker.addTarget(self, action: Selector("secondDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged) 
    }
    
    func secondDatePickerChanged(datePicker:UIDatePicker) {
        
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        
        //let toArray = strDate.componentsSeparatedByString("/")
        //let backToString = join("-", toArray)
        
        secondDateLabel.text = strDate
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showResults" {
 
            let patientID = patient!.id
            let firstDate = firstDateLabel!.text
            let secondDate = secondDateLabel!.text
            
            let address = "https://aura-app.herokuapp.com/api/patient/\(patientID)/episode/\(firstDate!)/\(secondDate!)"
            
            let patientURL = NSURL(string: address)
            
            let dataObject = NSData(contentsOfURL: patientURL!)
            let episodesArray: NSArray = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSArray

            println(episodesArray)
            
            var episodes: [Episode] = []
            
            for episode in episodesArray {
                let episodeRetrieved = episode as! NSDictionary
                let newEpisode = Episode(episodeDictionary: episodeRetrieved, patientId: patient!.id)
                episodes.append(newEpisode)
            }
    
            let resultsController = segue.destinationViewController as! ShowResultsController
            resultsController.episodes = episodes
            resultsController.patient = patient!
            
        }
    }
    
    @IBAction func search(sender: AnyObject) {
        performSegueWithIdentifier("showResults", sender: sender)
        
    }
}