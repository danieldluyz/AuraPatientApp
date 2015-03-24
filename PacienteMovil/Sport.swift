//
//  Sport.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Sport {
    
    var description: Int
    var intensity: Int
    var place: Int
    var climate: Int
    var hydration: Bool
    var episode: Episode
    
    init(sportDictionary: NSDictionary, episode: Episode){
        self.description = sportDictionary["description"] as Int
        self.intensity = sportDictionary["intensity"] as Int
        self.place = sportDictionary["place"] as Int
        self.climate = sportDictionary["climate"] as Int
        self.hydration = sportDictionary["hydration"] as Bool
        self.episode = episode
    }
    
    
}