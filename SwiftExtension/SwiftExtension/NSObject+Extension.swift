//
//  NSObject+Extension.swift
//  SwiftExtension
//
//  Created by Diep Nguyen on 4/17/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

extension NSObject {
    
    public var className: String {
        let name = String(describing: self)
        return name
    }
    
    public class var className: String {
        
        return String(describing: self)
    }
}
