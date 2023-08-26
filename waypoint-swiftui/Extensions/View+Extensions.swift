//
//  View+Extensions.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/25/23.
//

import SwiftUI

extension View {
    func textInputStyle() -> some View {
        modifier(TextInputStyle())
    }
}

struct TextInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.words)
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .clipped()
    }
}
