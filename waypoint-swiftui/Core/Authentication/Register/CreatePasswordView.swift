//
//  CreatePasswordView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    enum FocusedField {
        case password
        case confirmPassword
    }
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        let ifDisable: Bool = password == "" || confirmPassword == "" || password != confirmPassword || password.count < 8 || confirmPassword.count < 8
        
        VStack {
            VStack {
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.light)
                
                Text("Your password must be at least 8 characters")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }.padding(.vertical)
            
            SecureField("Password", text: $password)
                .textInputStyle()
                .textContentType(.password)
                .focused($focusedField, equals: .password)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textInputStyle()
                .textContentType(.password)
                .focused($focusedField, equals: .confirmPassword)
            
            Button {
                print("Register")
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
                focusedField = .password
            }
    }
}

#Preview {
    CreatePasswordView()
}
