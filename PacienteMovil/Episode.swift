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
        
    }
}
