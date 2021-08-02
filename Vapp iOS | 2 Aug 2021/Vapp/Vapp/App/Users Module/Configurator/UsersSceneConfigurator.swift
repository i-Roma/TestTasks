//
//  UsersSceneConfigurator.swift
//  Vapp
//
//  Created by Roman Home on 23.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import Foundation

final class UsersSceneConfigurator {
    
    // MARK: Configure
    
    static func configure(_ scene: UsersListViewController) {
        let interactor = UsersListInteractor()
        let presenter = UsersListPresenter()
        //let router = UsersListRouter()
        scene.interactor = interactor
        //scene.router = router
        interactor.presenter = presenter
        presenter.scene = scene
        //router.scene = scene
        //router.dataStore = interactor
    }
    
}
