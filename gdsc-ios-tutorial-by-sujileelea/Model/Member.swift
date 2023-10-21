//
//  Member.swift
//  gdsc-ios-tutorial-by-sujileelea
//
//  Created by Suji Lee on 10/19/23.
//

import SwiftUI

struct Member: Identifiable {
    
    var id: UUID = UUID()
    var profileImageData: Data?
    var name: String = ""
    var nickname: String = ""
    var mbti: String = ""
    var birthday: String = ""
    var favoriteColor: String = ""
    var drinkingCapacity: String = ""
}
