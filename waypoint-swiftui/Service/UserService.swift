//
//  UserService.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    private var db = Firestore.firestore()
    func fetchUser(withUid uid: String, completion: @escaping (UserModel) -> Void) {
        db.collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot else { return }

                guard let user = try? snapshot.data(as: UserModel.self) else { return }

                completion(user)
            }
    }

    func fetchUsers(completion: @escaping ([UserModel]) -> Void) {
        db.collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap { try? $0.data(as: UserModel.self) }
                completion(users)
            }
    }
}
