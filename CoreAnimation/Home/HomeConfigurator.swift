//
//  HomeConfigurator.swift
//  CoreAnimation
//
//  Created Pham Kien on 18.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomeConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> HomeViewController {
        
        //MARK: Initialise components.
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let interactor = HomeInteractor(withWorker: HomeWorker())
        let router = HomeRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
