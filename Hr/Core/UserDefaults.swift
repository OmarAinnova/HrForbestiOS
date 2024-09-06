//
//  UserDefaults.swift
//  Hr
//
//  Created by Omar Yousef on 10/09/2024.
//

import Foundation


extension UserDefaults {
    
    func saveCustomObject<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: key)
        }
    }
    
    func getCustomObject<T: Codable>(forKey key: String, objectType: T.Type) -> T? {
        if let savedData = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let loadedObject = try? decoder.decode(objectType, from: savedData) {
                return loadedObject
            }
        }
        return nil
    }
    
    // Save a boolean value
      func saveBool(_ value: Bool, forKey key: String) {
          self.set(value, forKey: key)
      }

      // Get a boolean value
      func getBool(forKey key: String) -> Bool {
          return self.bool(forKey: key)
      }
}
