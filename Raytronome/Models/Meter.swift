//
//  Meter.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import Foundation

struct Meter {
    let numerator: Int
    let denominator: Int
    
    var signature: String {
        return "\(numerator)/\(denominator)"
    }
}

extension Meter {
    init(signature: String) {
        let parts = signature.components(separatedBy: "/")
        guard parts.count == 2 else { fatalError() }
        
        self.numerator = Int(parts[0]) ?? 4
        self.denominator = Int(parts[1]) ?? 4
    }
}

extension Meter: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<Meter \(signature)>"
    }
}

extension Meter: Equatable { }
