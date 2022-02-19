//
//  ProductTableCell.swift
//  CoreAnimation
//
//  Created by Pham Kien on 18.02.22.
//

import UIKit

//protocol BaseCellPorotocol {
//    static  func getNibName()
//    static  func getNib()
//}

class ProductTableCell: UITableViewCell,BaseCellPorotocol {

    
    static let nibView = UINib(nibName: "ProductTableCell",
                               bundle: nil)
    static let Identifier = "ProductTableCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


