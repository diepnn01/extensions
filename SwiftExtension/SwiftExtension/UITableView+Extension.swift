//
//  UITableview+Extension.swift
//  SwiftExtension
//
//  Created by Diep Nguyen on 4/17/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func registerCell(nibName: String...) {
        
        for name in nibName {
            self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
        }
    }
    
    public func disableStickyHeader() {
        let dummyViewHeight = CGFloat(44)
        self.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: dummyViewHeight))
        self.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }
}
