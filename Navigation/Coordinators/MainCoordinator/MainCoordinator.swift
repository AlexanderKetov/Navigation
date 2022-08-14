//
//  MainCoordinator.swift
//  Navigation
//
//  Created by 4444 on 19.07.2022.
//

import Foundation
import UIKit

protocol MainCoordianatorProtocol {
    func startApplication() -> UIViewController
}

class MainCoordinator: MainCoordianatorProtocol {
    func startApplication() -> UIViewController {
        return TabBar()
    }
}
