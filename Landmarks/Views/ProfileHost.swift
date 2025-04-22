//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/22/25.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    @State private var isEditing = false
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            ProfileSummary(profile: modelData.profile)
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Edit") {
                    isEditing = true
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost(isPresented: .constant(true)).environment(ModelData())
}
