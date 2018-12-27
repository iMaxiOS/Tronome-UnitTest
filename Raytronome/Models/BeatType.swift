//
//  BeatType.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import class UIKit.UIImage

enum BeatType {
    case even
    case odd
}

extension BeatType {
    var image: UIImage? {
        switch self {
            case .even: return UIImage(named: "")
            case .odd: return UIImage(named: "")
        }
    }
}
