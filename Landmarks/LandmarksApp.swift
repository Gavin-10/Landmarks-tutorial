//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/17/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
