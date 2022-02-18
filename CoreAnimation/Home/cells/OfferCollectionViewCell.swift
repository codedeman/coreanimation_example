//
//  OfferCollectionViewCell.swift
//  CoreAnimation
//
//  Created by Pham Kien on 18.02.22.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {

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
        self.imgProduct.layer.cornerRadius = 2
        
        // Initialization code
    }
    
    

}
