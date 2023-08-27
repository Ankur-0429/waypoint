//
//  AuthViewModel.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import Firebase
import FirebaseFirestore
import SwiftUI

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()

    @Published var userSession: User?
    @Published var currentUser: UserModel?
    private let service = UserService()

    init() {
        userSession = auth.currentUser
        fetchUser()
    }

    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }

    var isSignedIn: Bool {
        auth.currentUser != nil
    }

    var isEmailVerified: Bool {
        guard let user = auth.currentUser else {
            return false
        }
        return user.isEmailVerified
    }

    func sendEmailVerification(email: String) {
        guard let currentUser = auth.currentUser else {
            return
        }
        currentUser.sendEmailVerification()
    }

    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {
            [weak self] result, error in

            guard result != nil, error == nil else {
                return
            }

            guard let user = result?.user
            else {
                return
            }

            self!.userSession = user
            self!.fetchUser()
        }
    }

    func signOut() {
        try? auth.signOut()
        userSession = nil
    }

    func uploadProfileImage(_ image: UIImage) {
        guard let uid = userSession?.uid else { return }

        ImageUploader.uploadImage(image: image, folder_location: "profile_image") {
            profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.fetchUser()
                }
        }
    }

    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) {
            result, error in

            guard result != nil, error == nil else {
                return
            }

            guard let user = result?.user
            else {
                return
            }

            self.userSession = user
        }
    }
}
