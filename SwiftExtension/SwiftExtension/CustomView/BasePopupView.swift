//
//  BasePopupView.swift
//  Carival
//
//  Created by ADMIN on 7/13/18.
//  Copyright © 2018 Crystal. All rights reserved.
//

import UIKit

open class BasePopupView: UIView {
    
    // MARK: - Public Function
    open func show(in view: UIView) {
        frame = view.bounds
        alpha = 0
        animatedView(isShow: true)
        view.addSubview(self)
    }
    
    open func show() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        for subView in window.subviews {
            if let popupSubView = subView as? BasePopupView {
                popupSubView.removeFromSuperview()
                break
            }
        }
        frame = window.bounds
        alpha = 0
        animatedView(isShow: true)
        window.addSubview(self)
    }
    
    open func dismiss() {
        animatedView(isShow: false)
    }
    
    // MARK: - Private Function
    private func animatedView(isShow: Bool) {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = isShow ? 1 : 0
        }, completion: { [weak self] (_: Bool) in
            if !isShow {
                self?.removeFromSuperview()
            }
        })
    }
}
