//
//  BaseCell.swift
//  CoreAnimation
//
//  Created by Pham Kien on 19.02.22.
//

import UIKit

protocol BaseCellPorotocol {
    static  func getNibName() -> String
    static  func getNib() -> UINib
}


extension BaseCellPorotocol where Self:UIView {
    
    static func getNibName() -> String {
        return String(describing: self)
    }
    static func  getNib() -> UINib {
        
        let mainBundle = Bundle.main
        return UINib.init(nibName: self.getNibName(), bundle: mainBundle)
        
    }

    
}

extension UITableView {
    
    func on_register<T:BaseCellPorotocol>(type:T.Type) {
        self.register(T.getNib(), forCellReuseIdentifier: T.getNibName())
    }
    
    func on_dequeue< T:BaseCellPorotocol> (idxPath : IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.getNibName(), for: idxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.getNibName())")
        }
        return cell
    }
}

extension UICollectionView {
    
    func on_register<T:BaseCellPorotocol> (type:T.Type) {
        self.register(T.getNib(), forCellWithReuseIdentifier: T.getNibName())
    }
    func on_dequeue<T:BaseCellPorotocol> (indxPath:IndexPath)-> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.getNibName(), for: indxPath) as? T else {
            fatalError("couldnt dequeue cell with identifier \(T.getNibName())")
        }
        return cell
    }
}
