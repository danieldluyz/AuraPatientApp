//
//  Food.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 24/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Food {
    
    var name: String
    var quantity: Int
    var episode: Episode?
    
    init(foodDictionary: NSDictionary, episode: Episode){
        self.name = foodDictionary["name"] as String
        self.quantity = foodDictionary["quantity"] as Int
        self.episode = episode
    }
    
}