//
//  ViewController.swift
//  testAppGestures
//
//  Created by fedir on 08.07.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - properties
    
    private var viewRotation: CGFloat = 0
    private var scaleX: CGFloat = 1
    private var scaleY: CGFloat = 1
    
    private let colours:[UIColor] = [.red,.yellow,.green,.orange]
    
    var indexer: Int = 0 {
        didSet { if indexer == colours.count {indexer = 0} }
    }
    
    //MARK: - outlets
    
    @IBOutlet weak var blueView: UIView!
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    
    //MARK: - actions
    
    //MARK: - rotating
    @IBAction func rotationblueViewGesture(_ sender: UIRotationGestureRecognizer) {
        if let obj = sender.view {
            obj.transform = obj.transform.rotated(by: sender.rotation) //поворот
            viewRotation += sender.rotation
            print(viewRotation)
            sender.rotation = 0
        }
    }
    
    
    //MARK: - single tap
    @IBAction func changeColorGesture(_ sender: UITapGestureRecognizer) {
       
        if let attach = sender.view {
            attach.backgroundColor = getnextColor()
        }
    }
    
    //MARK: - slide view
    @IBAction func moveVieGesture(_ sender: UIPanGestureRecognizer) {
        
        let transition = sender.translation(in: self.view)//сдвиг
        
        if let senderView = sender.view {
            senderView.center = CGPoint(x: senderView.center.x + transition.x,
                                       y: senderView.center.y + transition.y)
        }
        //обнуление результирующей точки
         sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    @IBAction func pinchGestureBluView(_ sender: UIPinchGestureRecognizer) {
        
        if let obj = sender.view {
            
            self.scaleX = sender.scale
            self.scaleY = sender.scale
            
            obj.transform = obj.transform.scaledBy(x: sender.scale, y: sender.scale)
            print(obj.transform.scaledBy(x: sender.scale, y: sender.scale))
            
            sender.scale = 1
        }
    }
    
    //MARK: - tap to mainView
    @IBAction func didtapMainView(_ sender: UITapGestureRecognizer) {
  
        UIView.animate(withDuration: 0.5) {
            self.blueView.backgroundColor = .systemBlue
            self.blueView.center = self.view.center
            self.blueView.transform = .init(rotationAngle: self.viewRotation)
            self.blueView.transform = .init(scaleX: self.scaleX , y: self.scaleY)
        }
    }
}

//MARK: - methods

private extension ViewController {
    
    func getnextColor() -> UIColor {
        let color = colours[indexer]
        indexer+=1
        return color
        
    }
}

//MARK: - UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
