//
//  CircleButton.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 23/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import Foundation
import UIKit

@objc(BookCore_CircleButton)
@IBDesignable public class CircleButton: UIButton{
    
    @IBInspectable public var cornerRadius: CGFloat = 0{
        didSet{
//            guard self.layer != nil else { return }
            self.layer.cornerRadius = self.frame.height / 2.0
        }
    }
    
    @IBInspectable public var borderWidht: CGFloat = 0{
        didSet{
//            guard self.layer != nil else { return }
            layer.borderWidth = borderWidht
        }
    }
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet{
//            guard self.layer != nil else { return }
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    func updateLayerProperties() {
              self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
              self.layer.shadowOffset = CGSize(width: 0, height: 3)
              self.layer.shadowOpacity = 3.0
              self.layer.shadowRadius = 10.0
              self.layer.masksToBounds = false
          }
}
