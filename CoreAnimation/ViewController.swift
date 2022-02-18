//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Pham Kien on 17.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vAnimation: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        animation.fillMode = .forwards
        
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 10
        animation.fromValue = vAnimation.layer.transform
        animation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
        vAnimation.layer.add(animation, forKey: "rotate")
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabButtonBtn(_ sender: Any) {
        
        let homeVC = HomeConfigurator.viewcontroller()
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
}

