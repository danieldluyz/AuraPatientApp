//
//  Episode.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Episode {
    
    var date: String
    var strength: Int
    var timeSlept: Int
    var normalSleepingCycle: Bool
    var place: Int
    var stress: Bool
    var patientId: String
    var symptoms: [Symptom] = []
    var sports: [Sport] = []
    var foods: [Food] = []
    var medicines: [Medicine] = []
    
    init (episodeDictionary: NSDictionary, patientId: String) {
        
        self.date = episodeDictionary["pubDate"] as String
        self.strength = episodeDictionary["intensity"] as Int
        self.timeSlept = episodeDictionary["sllepHours"] as Int
        self.normalSleepingCycle = episodeDictionary["regularSleep"] as Bool
        self.place = episodeDictionary["location"] as Int
        self.stress = episodeDictionary["stress"] as Bool
        self.patientId = patientId
        
        let symptomsRetrieved: NSArray = episodeDictionary["symptoms"] as NSArray
        
        for symptom in symptomsRetrieved{
            let symptomDictionary: NSDictionary = symptom as NSDictionary
            let newSymptom = Symptom(symptomDictionary: symptomDictionary, episode: self)
            symptoms.append(newSymptom)
        }
        
        let sportsRetrieved: NSArray = episodeDictionary["sports"] as NSArray
        
        for sport in sportsRetrieved{
            let sportDictionary: NSDictionary = sport as NSDictionary
            let newSport = Sport(sportDictionary: sportDictionary, episode: self)
            sports.append(newSport)
        }
        
        let foodsRetrieved: NSArray = episodeDictionary["foods"] as NSArray
        
        for food in foodsRetrieved{
            let foodDictionary: NSDictionary = food as NSDictionary
            let newFood = Food(foodDictionary: foodDictionary, episode: self)
            foods.append(newFood)
        }
        
        let medicinesRetrieved: NSArray = episodeDictionary["medicines"] as NSArray
        
        for medicine in medicinesRetrieved{
            let medicineDictionary: NSDictionary = medicine as NSDictionary
            let newMedicine = Medicine(medicineDictionary: medicineDictionary, episode: self)
            medicines.append(newMedicine)
        }
    }
}
