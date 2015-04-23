//
//  Patient.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 22/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

class Patient {
    
    var name: String
    var gender: Int
    var id: String = ""
    var mail: String
    var episodes: [Episode] = []
    var token = ""
    
    init (patientDictionary: NSDictionary) {
        
        self.name = patientDictionary["name"] as! String
        self.gender = patientDictionary["gender"] as! Int
        
        self.mail = patientDictionary["email"] as! String
        let episodesRetrieved: [NSDictionary] = patientDictionary["episodes"] as! [NSDictionary]
        
        for episode in episodesRetrieved {
            let newEpisode = Episode(episodeDictionary: episode, patientId: id)
            episodes.append(newEpisode) 
        }
        
        
    }
    
}
