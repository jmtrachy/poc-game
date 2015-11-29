//
//  Circle.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 6/22/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation
import SpriteKit

class Circle : Shape {//, Growable {
    
    // The standard fields for all concrete Shapes
    var xCoord: Int
    var yCoord: Int
    var deploymentState: Int
    var currentRadius: Float
    var fillColor: UIColor
    var strokeColor: UIColor
    
    // The standard fields for all concrete Growables, should probably be editable to some degree
    var growthRate: Float = 0.25
    let maxSize: Float = 20.0
    
    // For now simply accepts x and y positioning but should accept all features as the game expands
    init(x : Int, y : Int) {
        self.xCoord = x
        self.yCoord = y
        self.deploymentState = -50
        self.currentRadius = 0.0
        self.fillColor = UIColor.blueColor()
        self.strokeColor = UIColor.redColor()
    }
    
    // Circle growth is simple: increase the radius by the growth rate
    func grow() {
        self.currentRadius = self.currentRadius + self.growthRate
    }
    
    // Exceeding max size is simple to determine - if the radius is bigger than the maximum size return true
    func exceededMaxSize() -> Bool {
        return self.currentRadius > self.maxSize;
    }
    
    // Draws the shape - should the line width or glow width be adjustable here?
    func draw() -> SKShapeNode {
        var circle = SKShapeNode(circleOfRadius: self.currentRadius);
        circle.strokeColor = self.strokeColor
        circle.fillColor = self.fillColor
        circle.lineWidth = 1.0
        circle.glowWidth = 0.5
        circle.position = CGPoint(x:CGFloat(self.xCoord), y:CGFloat(self.yCoord))
        
        return circle
    }
    
}
