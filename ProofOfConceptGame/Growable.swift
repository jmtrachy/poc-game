//
//  Growable.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/19/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

protocol Growable {
    
    var growthRate : Float {get set}
    var maxSize : Float {get}

    func grow()
    func exceededMaxSize() -> Bool
    
}