//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Pham Kien on 17.02.22.
//

import UIKit

class ViewController: UIViewController {

    var colors = [UIColor.red,
                  UIColor.black,
                  UIColor.yellow,
                  UIColor.brown,
                  UIColor.systemPink,
                  UIColor.blue,
                  UIColor.red,
                  UIColor.black,
                  UIColor.yellow,
                  UIColor.brown,
                  UIColor.systemPink,
                  UIColor.blue,


            ]
    @IBOutlet weak var vAnimation: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var stateChange:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.on_register(type: OfferCollectionViewCell.self)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset  = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLogPressGesture(_:)))
        collectionView.addGestureRecognizer(gesture)
//        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
//        animation.fillMode = .forwards
//
//        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        animation.duration = 10
//        animation.fromValue = vAnimation.layer.transform
//        animation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
//        vAnimation.layer.add(animation, forKey: "rotate")
        self.view.backgroundColor = UIColor.yellow
        
//        let colorTop = UIColor(red: 216.0/255.0, green: 240.0/255.0, blue: 244.0/255.0, alpha: 1.0).cgColor
//
//        let gradientLayer:CAGradientLayer = CAGradientLayer()
//         gradientLayer.frame.size = self.vAnimation.frame.size
//         gradientLayer.colors =
//        [colorTop, UIColor.clear.cgColor]
//        //Use diffrent colors
//        gradientLayer.startPoint  = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
//        self.vAnimation.layer.addSublayer(gradientLayer)
        
        
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.duration = 0.07
//        animation.repeatCount = 100
//        animation.autoreverses = true
//        animation.fromValue = NSValue(cgPoint: CGPoint(x: vAnimation.center.x - 10, y: vAnimation.center.y))
//        animation.toValue = NSValue(cgPoint: CGPoint(x: vAnimation.center.x + 10, y: vAnimation.center.y))
//
//        vAnimation.layer.add(animation, forKey: "position")
//
        // Do any additional setup after loading the view.
    }
    @objc func handleLogPressGesture(_ gesture:UILongPressGestureRecognizer) {
        
        guard let collectionView = collectionView else {
            return
        }
        
        switch gesture.state {
        case .began:
            guard let targertIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                return
            }
            stateChange = true

            collectionView.beginInteractiveMovementForItem(at: targertIndexPath)
            break
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
            stateChange = true

            break
        case .ended:
            collectionView.endInteractiveMovement()
            stateChange = true

            break
        default:
            collectionView.cancelInteractiveMovement()
            stateChange = false
            break
        }
//        self.collectionView.reloadData()
        
    }

    @IBAction func didTabButtonBtn(_ sender: Any) {
        
        let homeVC = HomeConfigurator.viewcontroller()
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
}

extension ViewController:UICollectionViewDelegate {
    
    
    
}
extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:OfferCollectionViewCell = collectionView.on_dequeue(indxPath: indexPath)
        cell.vContent.backgroundColor = colors[indexPath.row]
        cell.stateWobble = stateChange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100/4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = colors.remove(at: sourceIndexPath.row)
        colors.insert(item, at: destinationIndexPath.row)
    }
    
//    override func didMove(toParent parent: UIViewController?) {
//
//    }
    
 
    
    
    
    
}
