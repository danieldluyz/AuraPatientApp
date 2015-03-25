//
//  Symptom.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 23/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Symptom {
    
    var symptom: Int
    var episode: Episode
    
    init(symptomDictionary: NSDictionary, episode: Episode){
        self.symptom = symptomDictionary["symptom"] as Int
        self.episode = episode
    }
    
    init (symptom: Int, episode: Episode)
    {
        self.symptom = symptom
        self.episode = episode
    }
    
}