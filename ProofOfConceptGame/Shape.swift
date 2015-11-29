//
//  Shape.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 7/8/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import Foundation
import SpriteKit

protocol Shape {

    // Standard attributes for all Shapes, all are flexible and thus concrete versions will not be allowed to be constants
    var xCoord: Int {get set}
    var yCoord: Int {get set}
    var deploymentState: Int {get set}
    var currentRadius: Float {get set}
    var strokeColor: UIColor {get set}
    var fillColor: UIColor {get set}
    
    var maxSize: Float {get}
    var growthRate: Float {get set}

    // Performs the actual drawing of this shape, returns an SKShapeNode to be drawn into the scene
    func draw() -> SKShapeNode
    func grow()
    func exceededMaxSize() -> Bool
    
}