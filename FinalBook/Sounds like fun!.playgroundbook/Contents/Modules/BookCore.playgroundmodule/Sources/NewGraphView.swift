//
//  NewGraphView.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 24/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import UIKit

@objc(BookCore_NewGraphView)

public class NewGraphView: UIView {
    
    
    
    @IBInspectable
    public var graphWidth: CGFloat = 0.97  { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    public var amplitude: CGFloat = 0.20   { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    public var periods = (352 * Model.instance.notas[Model.instance.notaSelecionada].frequencia) / (100 * 330)     { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    public var cor: UIColor = .clear {didSet{setNeedsDisplay()}}
    
    override public func draw(_ rect: CGRect) {
            let width = bounds.width
            let height = bounds.height
            
            let origin = CGPoint(x: 5, y: height * 0.50)
            
            let path = UIBezierPath()
            path.move(to: origin)
            
            for angle in stride(from: 5.0, through: 360.0 * periods, by: 5.0) {
                let x = origin.x + angle/(360.0 * periods) * width * graphWidth
                let y = origin.y - sin(angle/180.0 * .pi) * height * amplitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            cor.setStroke()
            
            path.lineWidth = 10
            
            let layer = CAShapeLayer()
            
            
        _ = CGRect(x: 0, y: 0, width: self.frame.width - 10, height: self.frame.height)
            layer.path = path.cgPath
            layer.strokeColor = cor.cgColor
            layer.fillColor = nil
            layer.lineWidth = 10
            layer.lineCap = .round
            self.layer.addSublayer(layer)
            
            
            
            let animation1 = CABasicAnimation(keyPath: "strokeEnd")
            animation1.fromValue = 0
            animation1.toValue = 1
            
            
            let animation2 = CABasicAnimation(keyPath: "strokeEnd")
            animation2.fromValue = 0
            animation2.toValue = 1
            
            let animations = CAAnimationGroup()
            animations.animations = [animation1, animation2]
            animations.duration = 2
            layer.add(animations, forKey: "line")
        
        
        
    }
    
}
