//
//  GameplayService.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/21/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

protocol GameplayService {
    
    var difficulty: Int {get set}
    
    // Setup the initial state of the game
    func initializeGame(gpInfo: GameplayInfo)
    
    // Advance the game based on the passed in state
    func advanceGame(gpInfo: GameplayInfo)
    
}