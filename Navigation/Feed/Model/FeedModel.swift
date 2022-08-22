//
//  FeedModel.swift
//  Navigation
//
//  Created by 4444 on 12.07.2022.
//

import Foundation

class FeedModel {
    
    private var etalonString: String = "Inser your String"
    
    func check(word: String) -> Bool {
        let answer: Bool = etalonString == word
        return answer
    }
}
