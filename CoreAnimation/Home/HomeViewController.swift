//
//  HomeViewController.swift
//  CoreAnimation
//
//  Created Pham Kien on 18.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol HomePresentationLogic: AnyObject {
    
}

// MARK: View
class HomeViewController: BaseViewController {
    
    
    @IBOutlet weak var vContainInfor: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var interactor: HomeInteractorLogic!
    var router: HomeRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch Home
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        self.vContainInfor.layer.cornerRadius = 10
        self.vContainInfor.clipsToBounds = true
        self.vContainInfor.backgroundColor = .white
        self.vContainInfor.layer.shadowColor = UIColor.black.cgColor
        self.vContainInfor.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.vContainInfor.layer.shadowOpacity = 0.7
        self.vContainInfor.layer.shadowRadius = 4.0

        self.collectionView.register(OfferCollectionViewCell.nibView, forCellWithReuseIdentifier: OfferCollectionViewCell.Identifier)
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.tableView.register(ProductTableCell.nibView, forCellReuseIdentifier: ProductTableCell.Identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.collectionView.scoll
        
        
        
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension HomeViewController: HomePresentationLogic {
    
}

extension HomeViewController:UICollectionViewDelegate {
    
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.Identifier, for: indexPath) as? OfferCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 250, height: 120)
    }
}

extension HomeViewController:UITableViewDelegate {
    
}

extension HomeViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableCell.Identifier, for: indexPath) as? ProductTableCell else { return UITableViewCell()}
        
        return cell

    }
}


