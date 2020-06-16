//
//  ViewController.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 20/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import UIKit
import SpriteKit
import CoreAudioKit
import AVFoundation

@objc(BookCore_ViewController)
public class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SKView!
    @IBOutlet weak var graph: Graph02!
    @IBOutlet weak var roundedBorderView: RoundedView!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var startStop: CircleButton!
    @IBAction func StartStop(_ sender: Any) {
        if !startStop.isSelected{
            startStop.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
            startStop.setTitle("STOP SOUND", for: .normal)
            Play()
            startStop.isSelected = true
        }else{
            startStop.backgroundColor = #colorLiteral(red: 0.6470588235, green: 0.9019607843, blue: 0.5411764706, alpha: 1)
            startStop.setTitle("START SOUND", for: .normal)
            Stop()
            startStop.isSelected = false
        }
    }
    
    
    var scene: SKScene!
    var cena: SKScene!
    
    var node: SKNode!
    var pos: CGFloat = 0.0
    
    let ball = SKSpriteNode(imageNamed: "ball")
    let barra = SKSpriteNode(imageNamed: "Rectangle")
    
    let ball2 = SKSpriteNode(imageNamed: "ball")
    
    //cria coisas do audiokit
    
    let engine = AVAudioEngine()
    let audioPlayer = AVAudioPlayerNode()
    let pitch = AVAudioUnitTimePitch()
    let speed = AVAudioUnitVarispeed()
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        _ = sceneView.frame.width * 0.8
        
        roundedBorderView.layer.zPosition = 30
        
        scene = SKScene(size: sceneView.bounds.size)
        scene.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9764705882, blue: 0.9882352941, alpha: 1)
        //confifgura barra
        barra.position = CGPoint(x: sceneView.frame.width / 2, y: 100)
        barra.size = CGSize(width: sceneView.frame.width * 0.8, height: 40)
        barra.name = "barra"
        
        //confirua seletor
        ball.position = CGPoint(x: 75, y: 100)
        ball.size = CGSize(width: 50, height: 50)
        ball.zPosition = 30
        ball.name = "ball"
        
        //adiciona itens na cena
        scene.addChild(ball)
        scene.addChild(barra)
        
        sceneView.presentScene(scene)
        graph.backgroundColor = .clear
        
        // cria outra cena pras ondinhas
        
        
        //        ball2.size = CGSize(width: 10, height: 10)
        //        ball2.position
        intensityLabel.text = "Low Notes"
        intensityLabel.textColor = UIColor(hue: (10 / (sceneView.frame.width - 80)), saturation: 0.4, brightness: 0.9, alpha: 1)
        graph.cor = UIColor(hue: (10 / (sceneView.frame.width - 80)), saturation: 0.4, brightness: 0.9, alpha: 1)
        
        
    }
   
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: scene)
        node = scene.atPoint(point)

        
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: scene)
        let tamanho = (sceneView.frame.width - 275)/3
        if node != nil && node.name == "ball"{
            if point.x >= 75 && point.x <= sceneView.bounds.width - 275{
                node.position.x = point.x
                graph.periods = (node.position.x/75) + 1
                
                var graphColor: CGFloat = 0.0
                graphColor = ((node.position.x - 40 ) / (sceneView.frame.width - 80))
                
                graph.cor = UIColor(hue: graphColor, saturation: 0.4, brightness: 0.9, alpha: 1)
                graph.setNeedsDisplay()
                intensityLabel.textColor = UIColor(hue: graphColor, saturation: 0.4, brightness: 0.9, alpha: 1)
                pitch.pitch = Float(node.position.x)
                
                if point.x < tamanho{
                    intensityLabel.text = "Low Notes"
                    
                } else if point.x >= tamanho + 75 && point.x < ((2 * tamanho) + 75){
                    intensityLabel.text = "Medium Notes"
                    
                }else if point.x >= ((2 * tamanho) + 75){
                    intensityLabel.text = "High Notes"
                    
                }
            }
        }
        
    }
    
    
    func Play() {
        
        
        let path = Bundle.main.path(forResource: "440", ofType: "wav")!
        let url = NSURL.fileURL(withPath: path)
        
        let file = try? AVAudioFile(forReading: url)
        let buffer = AVAudioPCMBuffer(pcmFormat: file!.processingFormat, frameCapacity: AVAudioFrameCount(file!.length))
        do {
            try file!.read(into: buffer!)
        } catch _ {
        }
        
        engine.attach(audioPlayer)
        
        engine.attach(pitch)
        
        engine.attach(speed)
        
        engine.connect(audioPlayer, to: speed, format: buffer?.format)
        
        engine.connect(speed, to: pitch, format: buffer?.format)
        
        engine.connect(pitch, to: engine.mainMixerNode, format: buffer?.format)
        
        audioPlayer.scheduleBuffer(buffer!, at: nil, options: AVAudioPlayerNodeBufferOptions.loops, completionHandler: nil)
        
        engine.prepare()
        do {
            try engine.start()
        } catch _ {
        }
        
        audioPlayer.play()
        
    }
    
    func Stop(){
        audioPlayer.stop()
    }
}

