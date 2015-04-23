//
//  Sport.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Sport {
    
    var desc: Int
    var intensity: Int
    var place: Int
    var climate: Int
    var hydration: Bool
    var episode: Episode
    
    init(sportDictionary: NSDictionary, episode: Episode){
        self.desc = sportDictionary["description"] as! Int
        self.intensity = sportDictionary["intensity"] as! Int
        self.place = sportDictionary["place"] as! Int
        self.climate = sportDictionary["climate"] as! Int
        self.hydration = sportDictionary["hydration"] as! Bool
        self.episode = episode
    }
    
    init (description: Int, intensity: Int, place: Int, climate: Int, hydration: Bool, episode: Episode)
    {
        self.desc = description
        self.intensity = intensity
        self.place = place
        self.climate = climate
        self.hydration = hydration
        self.episode = episode
    }
    
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSDictionary(objects: [desc, intensity, place, climate, hydration], forKeys: ["description", "intensity", "place", "climate", "hydration"])
        return dictionary
    }
    
}