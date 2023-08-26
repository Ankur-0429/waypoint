//
//  LoginView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/25/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Waypoint")
                    .font(.largeTitle)
                Text("Find Your Place")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }.padding(.vertical)
            
            TextField("Enter your email", text: $email)
                .textInputStyle()
            
            SecureField("Enter your password", text: $password)
                .textInputStyle()
            
            Button {
                print("forgot Password")
            } label: {
                Text("Forgot Password")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            
            Button {
                print("Login")
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }.padding(.vertical)
            
            Spacer()
            
            Divider()
            
            NavigationLink {
                Text("Sign Up")
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical, 16)
            
        }.padding(.horizontal, 24)
    }
}




#Preview {
    NavigationStack {
        LoginView()
    }
}
