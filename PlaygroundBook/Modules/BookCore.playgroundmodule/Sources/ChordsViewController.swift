//
//  ChordsViewController.swift
//  PlaygroundWWDC2020
//
//  Created by Gabriel Gazal on 21/02/20.
//  Copyright © 2020 com.gazodia. All rights reserved.
//

import UIKit
import Foundation

@objc(BookCore_ChordsViewController)
public class ChordsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.instance.acordes.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "chordsName", for: indexPath) as! ChordsCollectionViewCell
        cell.chordsName.text = Model.instance.acordes[indexPath.row].nome
        cell.backgroundColor = Model.instance.notas[indexPath.row].corSecundária
        cell.chordsName.textColor = .white
        cell.layer.cornerRadius = self.roundedView.layer.cornerRadius - spaceCellBorder
        cell.clipsToBounds = true
        
        return cell
        
    }
    //fidahuhfcdsuahfuahfua
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let space = (roundedView.bounds.width) / 3 - 2
        let space = (self.view.bounds.width - (roundedView.bounds.width - (2 * spaceCellBorder))) / 2
        return UIEdgeInsets(top: 0.0, left: space, bottom: 0.0, right: space)
    }
    //fihaifiahfii
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("lkjhgfd")
        let widht = roundedView.bounds.width
        let height = roundedView.bounds.height
        let spacing = spaceCellBorder * 2
        return CGSize(width: widht - spacing, height: height - spacing)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingInterCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        trocaAcorde(indexPath: indexPath.row)
        if indexPath.row == selectedChordIndex{
            for nota in Model.instance.acordes[indexPath.row].notasAcorde{
                switch nota {
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
        }
        
    }
    
   public func trocaAcorde(indexPath: Int){
        if indexPath != selectedChordIndex{
            selectedChordIndex = indexPath
            graph.layer.sublayers?.removeAll()
            mesmoAcorde = false
        }else{
            selectedChordIndex = indexPath
            mesmoAcorde = true
        }
        ajeitaBotoes()
    }
    
    @IBOutlet weak var roundedView: RoundedView!
    
    
    
    
    
    @IBOutlet public weak var chordsNameCollectionView: UICollectionView!
    
    @IBOutlet weak var CurvesFrame: EditableView!
    @IBOutlet weak var graph: NewGraphView!
    
    @IBOutlet var botoes: [CircleButton]!
    
    
    @IBAction public func tocaNota(_ sender: UIButton) {
        
        switch sender.tag{
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
    
    
    
    
    var acordeChange: () -> Void = {}
    var selectedChordIndex = 0
    var mesmoAcorde = false
    var spaceCellBorder:CGFloat = 15.0
    var spacingInterCell:CGFloat = 30.0
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.chordsNameCollectionView.collectionViewLayout = layout
        
        chordsNameCollectionView.delegate = self
        chordsNameCollectionView.dataSource = self
        ajeitaBotoes()
      
    }
    
   public func ajeitaBotoes(){
        let acordeSelec = Model.instance.acordes[selectedChordIndex]
        for botao in botoes{
            botao.backgroundColor = .lightGray
            botao.isEnabled = false
        }
        for nota in acordeSelec.notasAcorde{
            botoes[nota].backgroundColor = Model.instance.notas[nota].corPrincipal
            botoes[nota].isEnabled = true
            
            switch nota {
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
        
        if !mesmoAcorde{
            geraGrafico(sender: acordeSelec)
        }
    }
    
    func geraGrafico(sender: Chords){
        
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.graph.periods = (352 * Model.instance.notas[sender.notasAcorde[0]].frequencia) / (100 * 300)
            self.graph.cor = Model.instance.notas[sender.notasAcorde[0]].corPrincipal
            self.graph.amplitude = 0.20
            self.graph.setNeedsDisplay()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.graph.periods = (352 * Model.instance.notas[sender.notasAcorde[1]].frequencia) / (100 * 300)
            self.graph.cor = Model.instance.notas[sender.notasAcorde[1]].corPrincipal
            self.graph.amplitude = 0.15
            self.graph.setNeedsDisplay()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.graph.periods = (352 * Model.instance.notas[sender.notasAcorde[2]].frequencia) / (100 * 300)
            self.graph.cor = Model.instance.notas[sender.notasAcorde[2]].corPrincipal
            self.graph.amplitude = 0.10
            self.graph.setNeedsDisplay()
        })
        
    }
}


 extension ChordsViewController: UIScrollViewDelegate, UICollectionViewDelegate{
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.chordsNameCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthPlusSpace = (roundedView.bounds.width - (2 * spaceCellBorder)) + (2 * layout.minimumLineSpacing + spaceCellBorder - 5)
        
//        let cellWidthPlusSpace = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthPlusSpace
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthPlusSpace - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        
        
        let indice = Int(roundedIndex)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.trocaAcorde(indexPath: indice)

        })
    }
    
   public func changeSizeScaleToAlphaScale(_ x : CGFloat) -> CGFloat {
        let minScale : CGFloat = 0.8
        let maxScale : CGFloat = 1.0
        
        let minAlpha : CGFloat = 0.35
        let maxAlpha : CGFloat = 1.0
        
        return ((maxAlpha - minAlpha) * (x - minScale)) / (maxScale - minScale) + minAlpha
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let centerX = self.chordsNameCollectionView.center.x
    
        for cell in self.chordsNameCollectionView.visibleCells {
            
            let basePosition = cell.convert(CGPoint.zero, to: self.view)
            let cellCenterX = basePosition.x + self.chordsNameCollectionView.frame.size.height / 2.0
            
            let distance = abs(cellCenterX - centerX)
            
            let tolerance : CGFloat = 0.02
            var scale = 1.00 + tolerance - (( distance / centerX ) * 0.105)
            if(scale > 1.0){
                scale = 1.0
            }
           
            if(scale < 0.8){
                scale = 0.8
            }
            
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            
            let coverCell = cell as! ChordsCollectionViewCell
            coverCell.alpha = changeSizeScaleToAlphaScale(scale)
            
        }
    }
}
