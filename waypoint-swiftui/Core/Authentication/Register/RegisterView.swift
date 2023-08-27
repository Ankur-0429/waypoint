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
    
    enum FocusedField {
        case email
    }
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        let ifDisable: Bool = email == ""
        VStack {
            
            VStack {
                Text("Enter Email Address")
                    .font(.title)
                    .fontWeight(.light)
            }.padding(.vertical)
            
            TextField("Email", text: $email)
                .textInputStyle()
                .keyboardType(.emailAddress)
                .focused($focusedField, equals: .email)
            
            NavigationLink {
                VerifyEmailView(email: $email)
                    .navigationBarHidden(true)
                    .textContentType(.emailAddress)
            } label: {
                Text("Next")
                    .submitButtonStyle()
                    .opacity(ifDisable ? 0.6:1)
                    .animation(.linear, value: ifDisable)
            }.padding(.vertical)
                .disabled(ifDisable)
            
            Spacer()
            
        }.padding(.horizontal, 24)
            .onAppear {
                focusedField = .email
            }
    }
}

#Preview {
    NavigationView {
        RegisterView()
    }
}
