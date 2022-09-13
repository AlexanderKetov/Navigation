//
//  FeedModel.swift
//  Navigation
//
//  Created by 4444 on 12.07.2022.
//

import Foundation
import Combine

class FeedModel: ObservableObject {
    
    let service = FeedService()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var dataJSONSerialization: [ObjectFirstLink] = []
    @Published var dataJSON: Planet?
    
    private var etalonString: String = "Inser your String"
    
    func check(word: String) -> Bool {
        let answer: Bool = etalonString == word
        return answer
    }
    
    func receiveJSON() {
        service.receiveJSONSerialization()
        service.dataFromSerialization
            .receive(on: RunLoop.main)
            .sink { [weak self] dataJSON in
                
                var dictum: [ObjectFirstLink] = []
                if let dataJSON = dataJSON {
                    for item in dataJSON {
                        print(item)
                        dictum.append(.init(userId: item["userId"] as! Int, id: item["id"] as! Int, title: item["title"] as! String, completed: item["completed"] as! Bool))
                    }
                }
                self?.dataJSONSerialization = dictum
            }
            .store(in: &cancellables)
        
        service.receiveJSON()
        service.dataFromJSON
            .receive(on: RunLoop.main)
            .sink { [weak self] dataJSON in
                
                if let jsonObject = try? JSONDecoder().decode(Planet.self, from: dataJSON) {
                    self?.dataJSON = jsonObject
                }
            }
            .store(in: &cancellables)
    }
}
                 
struct ObjectFirstLink: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Planet: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
