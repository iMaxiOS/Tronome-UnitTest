//
//  UIStepper+Rx.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIStepper {
    public var maximumValue: Binder<Double> {
        return Binder(self.base) { stepper, value in
            stepper.maximumValue = value
        }
    }
}
