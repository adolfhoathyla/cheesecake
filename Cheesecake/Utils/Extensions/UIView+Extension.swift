//
//  UIView+Extension.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 24/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit

private var ActivityIndicatorViewAssociativeKey = "ActivityIndicatorViewAssociativeKey"
private var ActivityIndicatorViewSize: CGFloat = 40.0

public extension UIView {
    var activityIndicatorView: UIActivityIndicatorView {
        get {
            if let activityIndicatorView = getAssociatedObject(&ActivityIndicatorViewAssociativeKey)
                as? UIActivityIndicatorView {
                return activityIndicatorView
            } else {
                self.setNeedsLayout()
                self.layoutIfNeeded()
                let activityIndicatorView = UIActivityIndicatorView(frame:
                    CGRect(x: self.frame.width/2-ActivityIndicatorViewSize/2,
                           y: self.frame.height/2-ActivityIndicatorViewSize/2-30,
                           width: ActivityIndicatorViewSize,
                           height: ActivityIndicatorViewSize))
                activityIndicatorView.style = .gray
                activityIndicatorView.color = .gray
                activityIndicatorView.hidesWhenStopped = true
                addSubview(activityIndicatorView)
                
                setAssociatedObject(activityIndicatorView, associativeKey: &ActivityIndicatorViewAssociativeKey,
                                    policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityIndicatorView
            }
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue, associativeKey: &ActivityIndicatorViewAssociativeKey,
                                policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
