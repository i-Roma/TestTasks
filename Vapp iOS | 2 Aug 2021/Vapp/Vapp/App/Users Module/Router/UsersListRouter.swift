//
//  UsersListRouter.swift
//  Vapp
//
//  Created by Roman Home on 23.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import UIKit

/// Not used but I left here as an example
protocol UsersListRoutingLogic {
    func routeToNextScene()
    func routeToPreviouseScene()
}

/// Not used but I left here as an example
protocol UsersListDataPassing {
    var dataStore: UsersListDataStore? { get }
}

typealias UsersListRouterProtocols = (UsersListRoutingLogic & UsersListDataPassing)

// MARK: Router

final class UsersListRouter: UsersListRouterProtocols {
    
    // MARK: Properties
    
    weak var scene: UsersListViewController?
    
    // MARK: Dependencies
    
     var dataStore: UsersListDataStore?
    
    // MARK: Routing
    
    /// Not used but I left here as an example
    func routeToNextScene() {
        // Pass data if needed before transition
        
        /*
        // Passing data
        guard let dataStore = dataStore else { return }
        
        let destinationScene = scene
        var destinationDS = destinationScene.router!.dataStore!
         passDataToNextScene(source: dataStore, destination: &destinationDS)
        */
        
        // Do transition
    }
    
    /// Not used but I left here as an example
    func routeToPreviouseScene() {
        // Do transition
    }
    
    // MARK: Passing data
    /// Not used but I left here as an example
    /*func passDataToNextScene(source: CurrentDataStore, destination: inout NextDataStore) {
        destination.someData = source.someData
    }*/

}

