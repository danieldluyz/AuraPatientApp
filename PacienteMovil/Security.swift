//
//  Security.swift
//  PacienteMovil
//
//  Created by Daniel D'luyz O on 20/04/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import Foundation

class Security {
    
    let q1: Array<Character> = Array<Character>("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
    
    var q2: Array<Character> = Array<Character>("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    
    var letras: Dictionary<Character, Character> = Dictionary()
    var letrasReversa: Dictionary<Character, Character> = Dictionary()
    
    init(){
        for var i = 0; i < q1.count; i++ {
            
            var letra = q1[i]
            letras.updateValue(q2[i], forKey: q1[i])
            letrasReversa.updateValue(q2[i], forKey: q1[i])
        }
    }
    
    func cambiarLetras(w: String) -> String {
        
        var wr: String = ""
        var arr = Array(w)
        var arrresp: Array<Character> = Array<Character>();
        
        if (w != "") {
            for var i = 0; i < arr.count; i++ {
                var a: Character = letras[arr[i]]!;
                arrresp.insert(a, atIndex: i);
            }
            
            for var i = 0; i < arrresp.count; i++ {
                
                wr = "\(wr)\(arrresp[i])"
            }
            
        }
        return wr
    }
    
    func moduloPalabra(w: String) -> String {
        
        var r = Array(w)
        
        var respuesta: Array<Character> = Array<Character>();
        
        var resp: String = ""
        
        if w != "" {
            
            for var i = 0; i < r.count-1; i++ {
                respuesta.insert(r[i+1], atIndex: i)
            }
            
            respuesta.insert(r[0], atIndex: r.count - 1)
            
            respuesta[r.count-1]=r[0]
            
            for var i = 0; i < respuesta.count; i++ {
                resp = "\(resp)\(respuesta[i])";
            }
            
        }
        return resp
    }
    
    func encriptando(w: String) -> String {
        
        var x = moduloPalabra(w)
        return cambiarLetras(x)
    }
    
}
