//
//  ViewController.swift
//  ARPlanets
//
//  Created by Anoop tomar on 12/1/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var sunNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        self.createPlanets()
        let scene = SCNScene()
        scene.rootNode.addChildNode(self.sunNode)
        
        // Set the scene to the view
        self.sceneView.scene = scene
        
    }
    
    func createPlanets(){
        var mercuryNode: SCNNode!
        var venusNode: SCNNode!
        var earthNode: SCNNode!
        var marsNode: SCNNode!
        var jupiterNode: SCNNode!
        var saturnNode: SCNNode!
        var uranusNode: SCNNode!
        var neptuneNode: SCNNode!
        var plutoNode: SCNNode!
        
        self.sunNode = SCNNode(geometry: SCNSphere(radius: 0.25))
        mercuryNode = SCNNode(geometry: SCNSphere(radius: 0.02))
        venusNode = SCNNode(geometry: SCNSphere(radius: 0.04))
        earthNode = SCNNode(geometry: SCNSphere(radius: 0.03))
        marsNode = SCNNode(geometry: SCNSphere(radius: 0.05))
        jupiterNode = SCNNode(geometry: SCNSphere(radius: 0.15))
        saturnNode = SCNNode(geometry: SCNSphere(radius: 0.12))
        uranusNode = SCNNode(geometry: SCNSphere(radius: 0.09))
        neptuneNode = SCNNode(geometry: SCNSphere(radius: 0.08))
        plutoNode = SCNNode(geometry: SCNSphere(radius: 0.04))
        
        self.sunNode.position = SCNVector3Make(0, -0.1, -3)
        mercuryNode.position = SCNVector3Make(0.4, 0, 0)
        venusNode.position = SCNVector3Make(0.6, 0, 0)
        earthNode.position = SCNVector3Make(0.8, 0, 0)
        marsNode.position = SCNVector3Make(1.0, 0, 0)
        jupiterNode.position = SCNVector3Make(1.4, 0, 0)
        saturnNode.position = SCNVector3Make(1.68, 0, 0)
        uranusNode.position = SCNVector3Make(1.95, 0, 0)
        neptuneNode.position = SCNVector3Make(2.14, 0, 0)
        plutoNode.position = SCNVector3Make(2.319, 0, 0)
        
        self.sunNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "sun")
        mercuryNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "mercury")
        venusNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "venus")
        earthNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        marsNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "mars")
        jupiterNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jupiter")
        saturnNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "saturn")
        uranusNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "uranus")
        neptuneNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "neptune")
        plutoNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "pluto")

        self.sunNode.addChildNode(mercuryNode)
        self.sunNode.addChildNode(venusNode)
        self.sunNode.addChildNode(earthNode)
        self.sunNode.addChildNode(marsNode)
        self.sunNode.addChildNode(jupiterNode)
        self.sunNode.addChildNode(saturnNode)
        self.sunNode.addChildNode(uranusNode)
        self.sunNode.addChildNode(neptuneNode)
        self.sunNode.addChildNode(plutoNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
