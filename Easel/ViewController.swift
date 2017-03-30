//
//  ViewController.swift
//  Easel
//
//  Created by Vasco Gomes on 30/03/2017.
//  Copyright © 2017 Vasco Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonsStackView: UIStackView!
    
    var moveCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.appBecameActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    func appBecameActive(){
        self.buttonsStackView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
        self.buttonsStackView.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Moved: \(self.moveCount)")
        moveCount += 1
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
        self.buttonsStackView.isHidden = false
    }
}

