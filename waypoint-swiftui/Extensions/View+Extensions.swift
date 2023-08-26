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
    func submitButtonStyle() -> some View {
        modifier(SubmitButtonStyle())
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

struct SubmitButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(8)
    }
}
