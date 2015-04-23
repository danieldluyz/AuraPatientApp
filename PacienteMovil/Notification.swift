//
//  Notification.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 25/03/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

struct Notification {
    
    var stress: String
    var intensity: String
    var message: String
    var sleepTime: String
    
    init(sportDictionary: NSDictionary, episode: Episode){
        self.stress = sportDictionary["estres"] as! String
        self.intensity = sportDictionary["intensidad"] as! String
        self.message = sportDictionary["mensaje"] as! String
        self.sleepTime = sportDictionary["suenio"] as! String
    }
    
    func toDictionary() -> NSDictionary {
        let dictionary = NSDictionary(objects: [stress, intensity, message, sleepTime], forKeys: ["estres", "intensidad", "mensaje", "suenio"])
        return dictionary
    }
    
}