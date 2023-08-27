//
//  ContentView.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/25/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        let ifLogin = authViewModel.userSession == nil || !authViewModel.userSession!.isEmailVerified || authViewModel.currentUser == nil
        NavigationStack {
            if ifLogin {
                LoginView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
