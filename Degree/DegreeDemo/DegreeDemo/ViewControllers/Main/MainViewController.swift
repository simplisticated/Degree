//
//  MainViewController.swift
//  DegreeDemo
//
//  Created by Igor Matyushkin on 21.06.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Degree

class MainViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set gradient
        
        let gradientView = self.view as! GradientView
        gradientView.gradient = Gradient.make
            .from(
                GradientPoint(
                    x: .center,
                    y: .top
                )
            )
            .to(
                GradientPoint(
                    x: .center,
                    y: .bottom
                )
            )
            .step(withColor: .white, andLocation: 0.0)
            .step(withColor: .orange, andLocation: 0.5)
            .step(withColor: .purple, andLocation: 1.0)
            .get
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    // MARK: Protocol implementation
    
}
