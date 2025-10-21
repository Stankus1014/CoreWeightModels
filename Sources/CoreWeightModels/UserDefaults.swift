//
//  UserDefaults.swift
//  CoreWeightModels
//
//  Created by William Stankus on 10/20/25.
//
import Foundation

public extension UserDefaults {
    
    static var preferredUnitSystem: UnitSystem {
        get {
            guard let encodedData = UserDefaults.standard.object(forKey: UserDefaultKeys.preferredUnitSystem.rawValue) else { return .imperial }
            guard let unitSystem = try? JSONDecoder().decode(UnitSystem.self, from: encodedData as! Data) else { return .imperial }
            return unitSystem
        }
        set {
            do { UserDefaults.standard.set(try JSONEncoder().encode(newValue), forKey: UserDefaultKeys.preferredUnitSystem.rawValue) }
            catch { print(" --- ERROR SETTING UNIT SYSTEM --- ") }
        }
    }
    
}

internal enum UserDefaultKeys: String {
    case preferredUnitSystem = "PREFERRED_UNIT_SYSTEM"
}
