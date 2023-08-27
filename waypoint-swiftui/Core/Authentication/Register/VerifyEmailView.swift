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
    
    enum FocusedField {
        case confirmationCode
    }
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        let ifDisable: Bool = confirmationCode == ""
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
                .focused($focusedField, equals: .confirmationCode)
            
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
                focusedField = .confirmationCode
            }
    }
}

#Preview {
    VerifyEmailView(email: .constant("ankurahir0429@gmail.com"))
}
