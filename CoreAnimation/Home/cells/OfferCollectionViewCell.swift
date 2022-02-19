//
//  OfferCollectionViewCell.swift
//  CoreAnimation
//
//  Created by Pham Kien on 18.02.22.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell,BaseCellPorotocol {
    
    var stateWobble:Bool = false {
        didSet {
            if stateWobble == true {
                startWobbleAnimation()
            } else {
                stopWobble()
            }
        }
    }
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var vContent: UIView!
    static let nibView = UINib(nibName: "OfferCollectionViewCell",
                               bundle: nil)
    static let Identifier = "OfferCollectionViewCell"

    
//    class func imitWithNib() -> UINib {
//        let nibFile = UINib(nibName: self, bundle: nil)
//
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.vContent.backgroundColor = .white
        self.vContent.layer.shadowOpacity = 0.18
        self.vContent.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.vContent.layer.shadowRadius = 2
        self.vContent.layer.shadowColor = UIColor.black.cgColor
        self.vContent.layer.masksToBounds = false
        self.vContent.layer.cornerRadius = 2
        self.imgProduct.layer.cornerRadius = 2
//        startWobbleAnimation()
        
        // Initialization code
    }
    
    
    func startWobbleAnimation() {
        let angle = 2.0
        
        * Double.pi / 180.0
           self.transform = CGAffineTransform.identity.rotated(by: CGFloat(-angle));
           UIView.animate(withDuration: 0.25, delay: 0, options: [.allowUserInteraction,.repeat,.autoreverse], animations: {
                self.transform = CGAffineTransform.identity.rotated(by: CGFloat(angle));
           }, completion: nil)
    }
    
    func stopWobble() {

        UIView.animate(withDuration: 0.25, delay: 0, options: [.allowUserInteraction,.beginFromCurrentState,.curveLinear], animations: {
            self.transform = CGAffineTransform.identity;
        }, completion: nil)
    }
    

}
