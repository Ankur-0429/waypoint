//
//  RegisterView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var ifMoveToEmailVerifyScreen: Bool = false

    @EnvironmentObject var authViewModel: AuthViewModel

    enum FocusedField {
        case email
        case password
        case confirmPassword
    }

    @FocusState private var focusedField: FocusedField?

    var body: some View {
        let ifDisable: Bool = email == "" || password == "" || confirmPassword == "" || password != confirmPassword || password.count < 8 || confirmPassword.count < 8
        VStack {

            VStack {
                Text("Enter email and password")
                    .font(.title)
                    .fontWeight(.light)
            }.padding(.vertical)

            TextField("Email", text: $email)
                .textInputStyle()
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .focused($focusedField, equals: .email)

            SecureField("Password", text: $password)
                .textInputStyle()
                .textContentType(.password)
                .focused($focusedField, equals: .password)

            SecureField("Confirm Password", text: $confirmPassword)
                .textInputStyle()
                .textContentType(.password)
                .focused($focusedField, equals: .confirmPassword)

            Button {
                authViewModel.register(email: email, password: password)

                if authViewModel.userSession != nil {
                    ifMoveToEmailVerifyScreen.toggle()
                }
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
            .navigationDestination(isPresented: $ifMoveToEmailVerifyScreen) {
                VerifyEmailView(email: $email)
                    .navigationBarHidden(true)
            }
    }
}

#Preview {
    NavigationView {
        RegisterView()
    }
}
