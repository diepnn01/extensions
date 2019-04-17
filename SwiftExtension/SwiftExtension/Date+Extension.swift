//
//  Date+Extension.swift
//  QRCode
//
//  Created by Diep Nguyen on 4/10/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import UIKit

enum DateFormat: String {
    case client = "MM.dd.yyyy"
    case server = "yyyy-MM-dd HH:mm:ss"
}

extension Date {
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.server.rawValue
        formatter.locale = Locale.current
        return formatter
    }
    
    func getStringDate(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
