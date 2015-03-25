//
//  Medicine.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Medicine {
    
    var name: String
    var hoursAgo: Int
    var episode: Episode?
    
    init(medicineDictionary: NSDictionary, episode: Episode){
        self.name = medicineDictionary["name"] as String
        self.hoursAgo = medicineDictionary["hoursAgo"] as Int
        self.episode = episode
    }
    
    init (name: String, hoursAgo: Int, episode: Episode)
    {
        self.name = name
        self.hoursAgo = hoursAgo
        self.episode = episode
    }
}