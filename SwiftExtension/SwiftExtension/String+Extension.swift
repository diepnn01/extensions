//
//  String+Extension.swift
//  SwiftExtension
//
//  Created by Diep Nguyen on 4/17/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//


extension String {
    
    public func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func localize(arguments: String...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: arguments)
    }
    
    public func localize(arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: arguments)
    }
}
