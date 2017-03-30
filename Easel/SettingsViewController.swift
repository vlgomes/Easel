//
//  SettingsViewController.swift
//  Easel
//
//  Created by Vasco Gomes on 30/03/2017.
//  Copyright © 2017 Vasco Gomes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    
    weak var drawingVC : DrawingViewController? = nil
    var brushSize : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden =  false
        
        self.slider.value = Float(brushSize)
    }
    
    @IBAction func eraseTapped(_ sender: Any) {
        self.drawingVC?.eraseEasel()
        
        //to go back after erasing
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        self.drawingVC?.brush = CGFloat(self.slider.value)
        self.brushSize = CGFloat(self.slider.value)
    }

    @IBAction func shareTapped(_ sender: Any) {
        
        if let image = self.drawingVC?.imageView.image{
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}
