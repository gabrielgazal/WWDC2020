//
//  NotesViewController.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 21/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import UIKit

@objc(BookCore_NotesViewController)
public class NotesViewController: UIViewController{
    
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var CurvesFrame: EditableView!
    @IBOutlet weak var graph: GraphView!
    var lastSelectedNote: UIButton!
    @IBOutlet weak var botaoDoComeco: CircleButton!
    
    @IBAction func SelectNote(_ sender: UIButton) {
        lastSelectedNote?.setTitleColor(.white, for: .normal)
        Model.instance.notaSelecionada = sender.tag
        frequencyLabel.text = "\(Int(Model.instance.notas[sender.tag].frequencia))"
        frequencyLabel.textColor = Model.instance.notas[sender.tag].corPrincipal
        graph.periods = (352 * Model.instance.notas[sender.tag].frequencia) / (100 * 300)
        graph.setNeedsDisplay()
        sender.setTitleColor(Model.instance.notas[sender.tag].corSecundária, for: .normal)
        lastSelectedNote = sender
        
        switch sender.tag {
        case 0:
            AudioManager.shared.play(soundEffect: .C)
            
        case 1:
            AudioManager.shared.play(soundEffect: .D)
        case 2:
            AudioManager.shared.play(soundEffect: .E)
        case 3:
            AudioManager.shared.play(soundEffect: .F)
        case 4:
            AudioManager.shared.play(soundEffect: .G)
        case 5:
            AudioManager.shared.play(soundEffect: .A)
        case 6:
            AudioManager.shared.play(soundEffect: .B)
            
            
        default:
            AudioManager.shared.play(soundEffect: .C)

        }
    }
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        frequencyLabel.text = "\(Int(Model.instance.notas[Model.instance.notaSelecionada].frequencia))"
        frequencyLabel.textColor = Model.instance.notas[Model.instance.notaSelecionada].corPrincipal
        AudioManager.shared.play(soundEffect: .C)
        lastSelectedNote = botaoDoComeco
    }
    
    
    
}
