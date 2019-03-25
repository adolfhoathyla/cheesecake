//
//  NSObject+Extension.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 24/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import Foundation

extension NSObject {
    func setAssociatedObject(_ value: AnyObject?, associativeKey: UnsafeRawPointer, policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    func getAssociatedObject(_ associativeKey: UnsafeRawPointer) -> Any? {
        guard let valueAsType = objc_getAssociatedObject(self, associativeKey) else {
            return nil
        }
        return valueAsType
    }
}
