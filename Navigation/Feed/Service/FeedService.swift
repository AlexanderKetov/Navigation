//
//  FeedService.swift
//  Navigation
//
//  Created by 4444 on 11.09.2022.
//

import Foundation
import Combine
import UIKit

class FeedService {
    
    var dataFromSerialization = CurrentValueSubject<[[String:Any]]?, Never>(nil)
    var dataFromJSON = CurrentValueSubject<Data, Never>(Data())
    
    func receiveJSONSerialization() {
        let appConfiguration = AppConfiguration.linkFour
        let networkManager = NetworkManager(baseAddress: appConfiguration.rawValue)
        networkManager.requestSerialization() { (result) in
            switch result {
                case .success(let data):
                    self.dataFromSerialization.send(data)
                    print(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func receiveJSON() {
        let appConfiguration = AppConfiguration.linkFive
        let networkManager = NetworkManager(baseAddress: appConfiguration.rawValue)
        networkManager.request() { (result) in
            switch result {
                case .success(let data):
                    self.dataFromJSON.send(data)
                    print(data)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}
