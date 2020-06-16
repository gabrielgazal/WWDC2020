//
//  Itens.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 23/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import Foundation
import UIKit

class Notes{
    internal init(nota: String, corPrincipal: UIColor, corSecundária: UIColor, frequencia: CGFloat) {
        self.nota = nota
        self.corPrincipal = corPrincipal
        self.corSecundária = corSecundária
        self.frequencia = frequencia
    }
    
    
    var nota: String
    var corPrincipal: UIColor
    var corSecundária: UIColor
    var frequencia: CGFloat
    
}
