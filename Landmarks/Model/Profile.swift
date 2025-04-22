//
//  Profile.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/22/25.
//

import Foundation

struct Profile {
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue }
    }
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "gavinmcguinness")
}
