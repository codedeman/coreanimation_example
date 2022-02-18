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
class HomeViewController: BaseViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var imgBackGround: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vContainInfor: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var vGradient: UIView!
    @IBOutlet weak var scrollZoom: UIScrollView!
    var interactor: HomeInteractorLogic!
    var router: HomeRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        updateZoomFor(size: view.bounds.size)

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
        self.scrollView.delegate = self
        self.scrollZoom.delegate = self
        self.scrollZoom.minimumZoomScale = 1.0
        self.scrollZoom.maximumZoomScale = 5.0
        self.scrollZoom.zoomScale = 1.0
        
        self.vGradient.backgroundColor = UIColor.white
        let gradientLayer:CAGradientLayer = CAGradientLayer()
         gradientLayer.frame.size = self.vGradient.frame.size
         gradientLayer.colors =
        [UIColor.white.cgColor,UIColor.clear.cgColor]
        //Use diffrent colors
        gradientLayer.startPoint  = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.vGradient.layer.addSublayer(gradientLayer)
//        self.collectionView.scoll
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//
//        if let zoomImage = zoomImage {
//               setMinZoomScaleForImageSize(zoomImage.size)
//        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let height = scrollView.frame.size.height
       let contentYoffset = scrollView.contentOffset.y
       let distanceFromBottom = scrollView.contentSize.height - contentYoffset
       
        if contentYoffset < -40 {
            
            self.imgBackGround.contentScaleFactor = .greatestFiniteMagnitude
//            scrollZoom.contentSize = .init(width: 2000, height: 2000)
//            self.imgBackGround.
        }
   }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if scrollView == scrollZoom {
            return imgBackGround
        }
        return UIView()
    }

    func updateZoomFor(size: CGSize){
        let widthScale = size.width / imgBackGround.bounds.width
        let heightScale = size.height / imgBackGround.bounds.height
        let scale = min(widthScale,heightScale)
        scrollView.minimumZoomScale = scale
    }
    
    
    func  getAspectRatioAccording(_ imageSize:CGSize) ->Float {
        let  aspectRatio = imageSize.height / imageSize.width
        let targetWith = ScreenWidth()
        let targetHeight = (targetWith * aspectRatio)
        return Float(targetHeight)
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
    
    private func setMinZoomScaleForImageSize(_ imageSize: CGSize) {
        let widthScale = view.frame.width / imageSize.width
        let heightScale = view.frame.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        // Scale the image down to fit in the view
        scrollZoom.minimumZoomScale = minScale
        scrollZoom.zoomScale = minScale
        
        // Set the image frame size after scaling down
        let imageWidth = imageSize.width * minScale
        let imageHeight = imageSize.height * minScale
        let newImageFrame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        imgBackGround.frame = newImageFrame
        
        centerImage()
    }
    
    private func centerImage() {
        let imageViewSize = self.imgBackGround.frame.size
        let scrollViewSize = view.frame.size
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollZoom.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
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


