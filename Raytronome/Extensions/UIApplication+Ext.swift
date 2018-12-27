//
//  UIApplication+Ext.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import class UIKit.UIApplication
import class Foundation.ProcessInfo

extension UIApplication {
    class var isBeingTested: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
