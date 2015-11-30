//
//  CircleService.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 6/22/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation

class CircleService {
    
    var circles: [Circle];
    var circleCallCounter = 0;
    let canvasSize = (200, 200);
    
    init () {
        circles = [Circle]()
        //createCenteredCircle()
    }
        
    func createCenteredCircle() {
        // figure out x and y position in this method or have it passed in
        createCircle(100, yPos: 100)
    }

    func createCircle(xPos: Int, yPos: Int) -> Circle {
        let circle = Circle(x: xPos, y: yPos)
        circles.append(circle)
        return circle
    }
    
    func createRandomCircle() -> Circle {
        var validPoint = false
        var newX: Int
        var newY: Int
        var attempts = 0
        repeat {
            newX = Int(arc4random_uniform(320))
            newY = Int(arc4random_uniform(568))
            validPoint = isNewCircleValid(newX, yPos: newY)
        } while (!validPoint && attempts++ < 100)

        return createCircle(newX, yPos: newY)
    }
    
    func isNewCircleValid(xPos: Int, yPos: Int) -> Bool {
        /*
        var overlapsExistingCircle = false
        var counter = 0

        while !overlapsExistingCircle && counter < circles.count {
            var c = circles[counter++]
            let xDifference = abs(xPos - c.xCoord)
            let yDifference = abs(yPos - c.yCoord)
            
            let distanceFromCenters = sqrt((Double) (xDifference * xDifference + yDifference * yDifference))
            let combinedCircleSize = (Double) (2 * c.getMaxRadius())
            if distanceFromCenters < combinedCircleSize {
                overlapsExistingCircle = true
                println("Couldn't create cirlce at point (\(xPos), \(yPos))")
            }
        }
        
        return !overlapsExistingCircle
*/
        return true
    }
    
    func advanceGame() {
        deleteMaxCircles()
        growCircles()
        if circleCallCounter++ == 5 {
            circleCallCounter = 0
            createRandomCircle()
        }
        
    }
    
    func deleteMaxCircles() {
        /*
        var recordsToDelete = Int[]()
        var counter = 0
        for c in circles {
            if c.currentRadius == c.maxRadius {
                recordsToDelete.append(counter)
            }
            counter++
        }
        recordsToDelete = recordsToDelete.reverse()
        for i in recordsToDelete {
            circles.removeAtIndex(i);
        }
        */
        
    }
    
    func growCircles() {
        /*
        for c in circles {
            if c.currentRadius < c.maxRadius {
                c.currentRadius = c.currentRadius + 0.25;
            }
        }
        */
    }
    
}
