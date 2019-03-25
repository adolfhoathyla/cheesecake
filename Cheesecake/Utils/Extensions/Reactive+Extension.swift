//
//  Reactive+Extension.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 24/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }
}
