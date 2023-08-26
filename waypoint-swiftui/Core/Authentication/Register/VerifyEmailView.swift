//
//  VerifyEmailView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct VerifyEmailView: View {
    @State private var confirmationCode: String = ""
    
    @Binding var email: String
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Enter the confirmation code we sent to \(email)")
                    .font(.title2)
                    .fontWeight(.light)
                    .padding(.vertical)
                
                HStack(spacing: 0) {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("Change email address ")
                    }
                    .contentShape(Rectangle())
                    
                    Text("or")
                    
                    Button(action: {}) {
                        Text(" Send email alert again")
                    }
                    .contentShape(Rectangle())
                }
                .font(.footnote)
                
                
                
            }.padding(.vertical)
                .multilineTextAlignment(.center)
            
            TextField("Confirmation Code", text: $confirmationCode)
                .textInputStyle()
                .keyboardType(.numberPad)
            
            Button {
                print("Register")
            } label: {
                Text("Next")
                    .submitButtonStyle()
                    .disabled(confirmationCode == "")
                    .opacity(confirmationCode == "" ? 0.6:1)
                    .animation(.linear, value: email)
            }.padding(.vertical)
            
        }.padding(.horizontal, 24)
    }
}

#Preview {
    VerifyEmailView(email: .constant("ankurahir0429@gmail.com"))
}
