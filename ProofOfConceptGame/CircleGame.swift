//
//  CircleGame.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/21/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

class CircleGame : GameplayService {
    
    var difficulty: Int
    
    init(difficulty: Int) {
        self.difficulty = difficulty
    }
    
    func initializeGame(gpInfo: GameplayInfo) {
        // do stuff
        gpInfo.shapes.append(Circle(x: 300, y: 300))
    }
    
    func advanceGame(gpInfo: GameplayInfo) {
        growShapes(gpInfo.shapes)
        if shouldCreateAdditionalShape(gpInfo) {
            createShape(gpInfo)
        }
        deleteMaxCircles(gpInfo)
    }
    
    func growShapes(shapes: Shape[]) {
        for s in shapes {
            s.grow()
        }
    }
    
    func deleteMaxCircles(gpInfo: GameplayInfo) {
        
        var recordsToDelete = Int[]()
        var counter = 0
        for s in gpInfo.shapes {
            if s.exceededMaxSize() {
                recordsToDelete.append(counter)
            }
            counter++
        }
        recordsToDelete = recordsToDelete.reverse()
        for i in recordsToDelete {
            gpInfo.shapes.removeAtIndex(i);
        }
    }
    
    func createShape(gpInfo: GameplayInfo) {
        var s: Shape = createRandomCircle(gpInfo)
        gpInfo.shapes.append(s)
        gpInfo.timeLastShapeCreated = gpInfo.currentTime
    }
    
    func createRandomCircle(gpInfo: GameplayInfo) -> Circle {
        var validPoint = false
        var newX: Int
        var newY: Int
        var attempts = 0
        do {
            newX = Int(arc4random_uniform(320))
            newY = Int(arc4random_uniform(568))
            validPoint = isNewShapeValid(newX, yPos: newY, shapes: gpInfo.shapes)
        } while (!validPoint && attempts++ < 100)
        
        return createCircle(newX, yPos: newY)
    }
    
    func createCircle(xPos: Int, yPos: Int) -> Circle {
        return Circle(x: xPos, y: yPos)
    }
    
    func isNewShapeValid(xPos: Int, yPos: Int, shapes: Shape[]) -> Bool {
        var overlapsExistingCircle = false
        var counter = 0
        
        while !overlapsExistingCircle && counter < shapes.count {
            var s = shapes[counter++]
            let xDifference = abs(xPos - s.xCoord)
            let yDifference = abs(yPos - s.yCoord)
        
            let distanceFromCenters = sqrt((Double) (xDifference * xDifference + yDifference * yDifference))
            //TODO: Need to reconsider separating Shape and Growable
            let combinedCircleSize = (Double) (2 * 20)
            if distanceFromCenters < combinedCircleSize {
                overlapsExistingCircle = true
            }
        }
        
        return !overlapsExistingCircle
    }
    
    // generate algorithm for determining whether or not to create a new shape
    func shouldCreateAdditionalShape(gpInfo: GameplayInfo) -> Bool {
        
        var shapes = gpInfo.shapes
        var probability: Int = 0
        var probabilityByShapeCount: Int = 0
        var probabilityByTime: Int = 0
        var createNewShape = false
        
        // Determine the probability a shape will be created based on the number of existing shapes
        if shapes.count >= 10 {
            probabilityByShapeCount = 0
        } else {
            probabilityByShapeCount = (10 - shapes.count) * 10
        }
        
        // Determine the probability a shape will be created based on the length of time since the last shape was created
        if gpInfo.timeLastShapeCreated {
            var timeElapsed = gpInfo.currentTime - gpInfo.timeLastShapeCreated!
            if timeElapsed < 1.0 {
                probabilityByTime = 0
            } else {
                probabilityByTime = Int(timeElapsed * 10)
            }
            
            println("probabiltyByTime = \(probabilityByTime); timeElapsed = \(timeElapsed)")
        } else {
            probabilityByTime = 100
        }
        
        probability = (probabilityByShapeCount + probabilityByTime) / 2
        
        let randomDieRoll = Int(arc4random_uniform(100))
//        println("Probability = \(probability) and random roll = \(randomDieRoll)")
        if randomDieRoll <= probability {
            createNewShape = true
        }
        
        return createNewShape
    }
    
}