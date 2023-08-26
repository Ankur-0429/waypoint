//
//  RegisterView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Enter Email Address")
                    .font(.title)
                    .fontWeight(.light)
            }.padding(.vertical)
            
            TextField("Email", text: $email)
                .textInputStyle()
            
            Button {
                print("Register")
            } label: {
                Text("Next")
                    .submitButtonStyle()
                    .disabled(email == "")
                    .opacity(email == "" ? 0.6:1)
                    .animation(.linear, value: email)
            }.padding(.vertical)
            
        }.padding(.horizontal, 24)
    }
}

#Preview {
    NavigationView {
        RegisterView()
    }
}
