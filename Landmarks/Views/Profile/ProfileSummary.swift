//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/22/25.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(profile.prefersNotifications)")
            Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
            Text("Goal date: ") + Text(profile.goalDate, style: .date)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal) {
                    HStack {
                        HikesBadge(name: "First Hike")
                        HikesBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikesBadge(name: "Tenth Hike")
                            .hueRotation(Angle(degrees: 200))
                    }
                    .padding(.bottom)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: modelData.hikes[0])
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
