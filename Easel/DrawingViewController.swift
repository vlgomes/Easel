//
//  ViewController.swift
//  Easel
//
//  Created by Vasco Gomes on 30/03/2017.
//  Copyright © 2017 Vasco Gomes. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var buttonsStackView: UIStackView!
    
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(DrawingViewController.appBecameActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    func appBecameActive(){
        self.buttonsStackView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.buttonsStackView.isHidden = true
        
        if let touch =  touches.first{
            let point = touch.location(in: self.imageView)
            
            self.lastPoint = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch =  touches.first{
            let point = touch.location(in: self.imageView)
            
            //To draw we have to begin and get the context
            UIGraphicsBeginImageContext(self.imageView.frame.size)
            let context = UIGraphicsGetCurrentContext()
            
            self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
            
            context?.move(to: self.lastPoint)
            context?.addLine(to: point)
            
            context?.setLineWidth(15.0)
            context?.setLineCap(.round)
            
            context?.setStrokeColor(UIColor(displayP3Red: 0.3, green: 0.6, blue: 0.2, alpha: 1).cgColor)
            
            context?.strokePath()
            
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.lastPoint = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
        self.buttonsStackView.isHidden = false
    }
    
    func eraseEasel(){
        
        self.imageView.image = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "drawingToSettingsSegue"{
            let settingsVC = segue.destination as! SettingsViewController
            
            settingsVC.drawingVC = self
        }
    }
}

