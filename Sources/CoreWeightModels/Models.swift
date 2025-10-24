//
//  Models.swift
//  CoreWeightModels
//
//  Created by William Stankus on 10/20/25.
//

import Foundation

public struct Weight: Codable {
    public var value: Double
    public var unitSystem: UnitSystem
    
    public init(value: Double, unitSystem: UnitSystem) {
        self.value = value
        self.unitSystem = unitSystem
    }
}

public extension Weight {
    func normalized() -> Weight {
        if unitSystem == UserDefaults.preferredUnitSystem { return self }
        
        return self.convertToPreferredUnitSystem()
    }
    
    private func convertToPreferredUnitSystem() -> Weight {
        switch self.unitSystem {
        case .imperial:
            // Convert lb → kg
            let convertedValue = self.value * 0.45359237
            return Weight(value: convertedValue, unitSystem: .metric)

        case .metric:
            // Convert kg → lb
            let convertedValue = self.value / 0.45359237
            return Weight(value: convertedValue, unitSystem: .imperial)
        }
    }
}

public enum UnitSystem : Codable {
    case imperial
    case metric
}
