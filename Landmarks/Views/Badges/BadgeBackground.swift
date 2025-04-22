//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Gavin McGuinness on 4/19/25.
//

import SwiftUI

struct BadgeBackground: View {
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width * 0.75, geometry.size.height * 0.75)
            let offset = min(geometry.size.width * 0.125, geometry.size.height * 0.125)
            
            Path(
                roundedRect: CGRect(
                    x: offset,
                    y: offset,
                    width: size,
                    height: size
                ),
                cornerRadius: size / 4.0,
                style: .continuous
            )
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    BadgeBackground()
}
