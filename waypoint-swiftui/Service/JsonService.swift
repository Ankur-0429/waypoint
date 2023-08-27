//
//  JsonService.swift
//  waypoint-swiftui
//
//  Created by Ankur Ahir on 8/26/23.
//

import Foundation

struct JsonService {
    static func modelToDictionary<T: Codable>(_ model: T) -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        do {
            let modelData = try encoder.encode(model)
            let dictionary = try JSONSerialization.jsonObject(with: modelData, options: []) as? [String: Any]
            return dictionary
        } catch {
            return nil
        }
    }

    static func dictionaryToModel<T: Codable>(_ dictionary: [String: Any], type: T.Type) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let model = try JSONDecoder().decode(type, from: jsonData)
            return model
        } catch {
            return nil
        }
    }
}
