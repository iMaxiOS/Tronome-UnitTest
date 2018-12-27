//
//  UIView+Ext.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set(radius) {
            layer.cornerRadius = radius
            layer.masksToBounds = radius > 0
        }
    }
}
