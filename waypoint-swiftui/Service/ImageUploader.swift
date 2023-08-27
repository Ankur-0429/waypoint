//
//  ImageUploader.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, folder_location: String, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }

        let storage = Storage.storage()

        let filename = NSUUID().uuidString
        let ref = storage.reference(withPath: "/\(folder_location)/\(filename)")

        ref.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                return
            }

            ref.downloadURL { imageUrl, error in
                if error != nil {
                    print("\(String(describing: error?.localizedDescription))")
                    return
                }
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
