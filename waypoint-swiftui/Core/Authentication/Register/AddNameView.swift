//
//  AddNameView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import SwiftUI

struct AddNameView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    enum FocusedField {
        case firstName
        case lastName
    }
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        let ifDisable: Bool = firstName == "" || lastName == ""
        VStack {
            VStack {
                Text("Add your name")
                    .font(.title2)
                    .fontWeight(.light)
                
                Text("Add your name so that friends can find you")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }.padding(.vertical)
            
            TextField("First Name", text: self.$firstName)
                .textInputStyle()
                .focused($focusedField, equals: .firstName)
            
            TextField("Last Name", text: self.$lastName)
                .textInputStyle()
                .focused($focusedField, equals: .lastName)
            
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
                focusedField = .firstName
            }
    }
}

#Preview {
    AddNameView()
}
