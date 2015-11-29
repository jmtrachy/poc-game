//
//  GameScene.swift
//  ProofOfConceptGame
//
//  Created by James Trachy on 6/22/14.
//  Copyright (c) 2014 James Trachy. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var lastTime: CFTimeInterval?
    var gpService: GameplayService?
    var gpInfo: GameplayInfo?
    
    override func didMoveToView(view: SKView) {
        self.scaleMode = SKSceneScaleMode.ResizeFill
        
        // call factory static method to attempt to get game - for now it just returns a CircleGame
        gpService = GameplayServiceFactory.createGame(1)
        
        // Create a GameplayInfo object which holds the state of the games objects
        gpInfo = GameplayInfo()
        
        // Pass the state container into the game, allow it to be populated with objects
        gpService!.initializeGame(gpInfo!)
        
        // Render the game's objects
        renderGame(gpInfo!)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
    }
    
    // Renders the graphics of the game based on the state of all the objects
    func renderGame(gpInfo: GameplayInfo) {
        // clear the screen
        removeAllChildren()
        
        // render all shapes in the gameplay info
        drawShapes(gpInfo.shapes)
        
        // Draw the game piece
        // TODO: Draw the game token
    }
    
    // Loop through the shapes and call drawShape on each
    func drawShapes(shapes: Shape[]) {
        for s in shapes {
            drawShape(s)
        }
    }
    
    // Call each shapes draw method to allow it to render itself
    func drawShape(s: Shape) {
        self.addChild(s.draw())
    }
   
    
    override func update(currentTime: CFTimeInterval) {
        gpInfo!.currentTime = currentTime
        gpService!.advanceGame(gpInfo!)
        renderGame(self.gpInfo!)
    }
    
}
