//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/22/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ModelData.self) var modelData
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Allow Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    profile = modelData.profile
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    modelData.profile = profile
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(Profile.default))
        .environment(ModelData())
}
