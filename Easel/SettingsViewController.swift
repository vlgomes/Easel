//
//  SettingsViewController.swift
//  Easel
//
//  Created by Vasco Gomes on 30/03/2017.
//  Copyright © 2017 Vasco Gomes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var drawingVC : DrawingViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden =  false
    }
    
    @IBAction func eraseTapped(_ sender: Any) {
        self.drawingVC?.eraseEasel()
        
        //to go back after erasing
        self.navigationController?.popViewController(animated: true)
    }

}
