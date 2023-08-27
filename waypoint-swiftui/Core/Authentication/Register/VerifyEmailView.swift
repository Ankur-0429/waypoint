//
//  VerifyEmailView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct VerifyEmailView: View {
    @Binding var email: String
    @State private var showAlert: Bool = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authViewModel: AuthViewModel

    func checkVerification() {
        if authViewModel.isEmailVerified {
            // move to next screen
        } else {
            showAlert.toggle()
        }
    }

    var body: some View {
        VStack {
            VStack {
                Text("We sent a link to \(email)")
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

                    Button {
                        authViewModel.sendEmailVerification(email: email)
                    } label: {
                        Text(" Send email alert again")
                    }
                    .contentShape(Rectangle())
                }
                .font(.footnote)

            }.padding(.vertical)
                .multilineTextAlignment(.center)

            Button {
                checkVerification()
            } label: {
                Text("Next")
                    .submitButtonStyle()
            }.padding(.vertical)

            Spacer()

        }.padding(.horizontal, 24)
            .onAppear {
                authViewModel.sendEmailVerification(email: email)
            }
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Your email is not verified"),
                        message: Text("please click the link found in your email or resend the verification link")
                    )
                }
    }
}

#Preview {
    VerifyEmailView(email: .constant("ankurahir0429@gmail.com"))
}
