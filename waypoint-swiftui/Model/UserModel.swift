//
//  UserModel.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import FirebaseFirestoreSwift
import Foundation

struct UserModel: Codable, Identifiable {
    @DocumentID var id: String?
    let username: String
    let firstName: String
    let lastName: String
    let profileImageUrl: String?
    let email: String
    let uid: String
}
