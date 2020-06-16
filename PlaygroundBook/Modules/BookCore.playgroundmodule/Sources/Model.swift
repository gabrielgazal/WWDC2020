//
//  Model.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 23/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import Foundation
import UIKit

public class Model{
    
    static public let instance = Model()
    
    var notas: [Notes]!
    var acordes: [Chords]!
    var notaSelecionada = 0
    var tonica = -1
    var terca = 0
    var quinta = 0
    var notasDoAcorde: [UIButton] = []
    
    public init (){
        notas = [
            Notes(nota: "C", corPrincipal: #colorLiteral(red: 0.5411764706, green: 0.7568627451, blue: 0.9019607843, alpha: 1), corSecundária: #colorLiteral(red: 0.1568627451, green: 0.5058823529, blue: 0.7411764706, alpha: 1), frequencia: 261),
            Notes(nota: "D", corPrincipal: #colorLiteral(red: 0.9019607843, green: 0.5411764706, blue: 0.862745098, alpha: 1), corSecundária: #colorLiteral(red: 0.7411764706, green: 0.1568627451, blue: 0.6784313725, alpha: 1), frequencia: 293),
            Notes(nota: "E", corPrincipal: #colorLiteral(red: 0.9019607843, green: 0.8470588235, blue: 0.5411764706, alpha: 1), corSecundária: #colorLiteral(red: 0.7411764706, green: 0.6509803922, blue: 0.1568627451, alpha: 1), frequencia: 329),
            Notes(nota: "F", corPrincipal: #colorLiteral(red: 0.5411764706, green: 0.9019607843, blue: 0.737254902, alpha: 1), corSecundária: #colorLiteral(red: 0.1568627451, green: 0.7411764706, blue: 0.4745098039, alpha: 1), frequencia: 349),
            Notes(nota: "G", corPrincipal: #colorLiteral(red: 0.631372549, green: 0.5411764706, blue: 0.9019607843, alpha: 1), corSecundária: #colorLiteral(red: 0.3058823529, green: 0.1568627451, blue: 0.7411764706, alpha: 1), frequencia: 392),
            Notes(nota: "A", corPrincipal: #colorLiteral(red: 0.9019607843, green: 0.5411764706, blue: 0.5411764706, alpha: 1), corSecundária: #colorLiteral(red: 0.7411764706, green: 0.1568627451, blue: 0.1568627451, alpha: 1), frequencia: 440),
            Notes(nota: "B", corPrincipal: #colorLiteral(red: 0.6470588235, green: 0.9019607843, blue: 0.5411764706, alpha: 1), corSecundária: #colorLiteral(red: 0.3294117647, green: 0.7411764706, blue: 0.1568627451, alpha: 1), frequencia: 493),
        ]
        
        acordes = [
            Chords(notasAcorde: [0,2,4], nome: "C Major"),
            Chords(notasAcorde: [1,3,5], nome: "D Minor"),
            Chords(notasAcorde: [2,4,6], nome: "E Minor"),
            Chords(notasAcorde: [3,5,0], nome: "F Major"),
            Chords(notasAcorde: [4,6,1], nome: "G Major"),
            Chords(notasAcorde: [5,0,2], nome: "A Minor"),
        ]
        
    }
    
}
