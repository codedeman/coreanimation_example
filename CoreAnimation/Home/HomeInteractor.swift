//
//  HomeInteractor.swift
//  CoreAnimation
//
//  Created Pham Kien on 18.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// Home Module Interactor Protocol
protocol HomeInteractorLogic {
    
}

/// Home Module Interactor
class HomeInteractor {
    weak var presenter: HomePresentationLogic!
    weak var router: HomeRoutingLogic!
    private var worker: HomeWorkerLogic
    
    required init(withWorker worker: HomeWorkerLogic) {
        self.worker = worker
    }
}

extension HomeInteractor: HomeInteractorLogic {

}

