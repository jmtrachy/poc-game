//
//  GameplayServiceFactory.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/21/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

class GameplayServiceFactory {
    
    class func createGame(gameSelected: Int) -> GameplayService {
        return CircleGame(difficulty: 1)
    }
    
}