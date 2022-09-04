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
    
    func request() {
        let task = urlSession.dataTask(with: self.baseAddress) { data, response, errors in
            if (errors != nil) {
                print("network errors localizedDescription \(String(describing: errors?.localizedDescription))")
                print("network errors debugDescription \(String(describing: errors.debugDescription))")
            } else {
                guard let object = try? JSONSerialization.jsonObject(with: data ?? Data(), options: []),
                      let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                      let dataPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                print(dataPrintedString)
                let httpResponse = response as! HTTPURLResponse
                print("All headers fields: \(httpResponse.allHeaderFields)")
                print("status code: \(httpResponse.statusCode)")
            }
        }
        task.resume()
        ()
    }
}
