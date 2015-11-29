//
//  GameplayInfo.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/19/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

class GameplayInfo {
    
    var shapes: Shape[]
    var timeLastShapeCreated: CFTimeInterval?
    var lastUpdateTime: CFTimeInterval
    var currentTime: CFTimeInterval
    
    init() {
        shapes = Shape[]()
        currentTime = CFTimeInterval()
        lastUpdateTime = CFTimeInterval()
    }
    
}