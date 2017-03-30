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
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(DrawingViewController.appBecameActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        //so the start color could be blue
        self.blueTapped(UIButton())
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
            
            drawBetweenPoints(firstPoint: self.lastPoint,secondPoint: point)
            
            self.lastPoint = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch =  touches.first{
            let point = touch.location(in: self.imageView)
            
            drawBetweenPoints(firstPoint: self.lastPoint,secondPoint: point)
        }

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
    
    func drawBetweenPoints(firstPoint:CGPoint, secondPoint:CGPoint){
        //To draw we have to begin and get the context
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        context?.move(to: firstPoint)
        context?.addLine(to: secondPoint)
        
        context?.setLineWidth(15.0)
        context?.setLineCap(.round)
        
        context?.setStrokeColor(UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1).cgColor)
        
        context?.strokePath()
        
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    @IBAction func blueTapped(_ sender: Any) {
        self.red = 56 / 256
        self.green = 109 / 256
        self.blue = 229 / 256
    }
    
    @IBAction func greenTapped(_ sender: Any) {
        self.red = 37 / 256
        self.green = 235 / 256
        self.blue = 114 / 256
    }
    
    @IBAction func redTapped(_ sender: Any) {
        self.red = 229 / 256
        self.green = 56 / 256
        self.blue = 56 / 256
    }

    @IBAction func yellowTapped(_ sender: Any) {
        self.red = 249 / 256
        self.green = 215 / 256
        self.blue = 23 / 256
    }
    
    @IBAction func randomTapped(_ sender: Any) {
        self.red = CGFloat(arc4random_uniform(256)) / 256
        self.green = CGFloat(arc4random_uniform(256)) / 256
        self.blue = CGFloat(arc4random_uniform(256)) / 256
    }
}

