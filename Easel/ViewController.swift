//
//  ViewController.swift
//  Easel
//
//  Created by Vasco Gomes on 30/03/2017.
//  Copyright © 2017 Vasco Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
}
