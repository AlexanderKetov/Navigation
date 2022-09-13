//
//  NetworkManager.swift
//  Navigation
//
//  Created by Кетов Александр on 24.08.2022.
//

import Foundation

enum AppConfiguration: String {
    case linkOne = "https://swapi.dev/api/people/8"
    case linkTwo = "https://swapi.dev/api/starships/3"
    case linkThree = "https://swapi.dev/api/planets/5"
    case linkFour = "https://jsonplaceholder.typicode.com/todos/"
    case linkFive = "https://swapi.dev/api/planets/1"
}

final class NetworkManager {
    
    let baseAddress: URL
    
    private let urlSession: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    init(baseAddress: String) {
        guard let adress = URL(string: baseAddress) else {
            self.baseAddress = URL(string: "")!
            return
        }
        self.baseAddress = adress
    }
    
    func requestSerialization(completion: @escaping (Result<[[String:Any]], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: self.baseAddress) { data, response, errors in
            
            if (errors != nil) {
                print("network errors localizedDescription \(String(describing: errors?.localizedDescription))")
                print("network errors debugDescription \(String(describing: errors.debugDescription))")
            } else {
                do {
                    guard let object = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [[String:Any]]? else {return}
                    
                    if let error = errors {
                        completion(.failure(error))
                    }
                    if let objectIn = object {
                        completion(.success(objectIn))
                    }
                }
            }
        }.resume()
    }
    
    func request(completion: @escaping (Result<Data, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: self.baseAddress) { data, response, errors in
            
            if (errors != nil) {
                print("network errors localizedDescription \(String(describing: errors?.localizedDescription))")
                print("network errors debugDescription \(String(describing: errors.debugDescription))")
            } else {
                do {
                    guard let object = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []),
                    let dataJSON = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]) else {return}
                    
                    if let error = errors {
                        completion(.failure(error))
                    } else {
                        completion(.success(dataJSON))
                    }
                }
            }
        }.resume()
    }
}
