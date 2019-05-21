//
//  UIViewController+Extension.swift
//  QRCode
//
//  Created by Diep Nguyen on 4/10/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    open func getParentViewController(_ current: UIView) -> UIViewController? {
        var parentController: UIViewController?
        var responder: UIResponder? = current
        while true {
            responder = responder?.next
            if responder == nil {
                break
            }
            parentController = responder as? UIViewController
            if parentController != nil {
                break
            }
        }
        return parentController
    }
}
