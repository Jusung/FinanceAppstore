//
//  String+Helpers.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation

extension String {
    public func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        let date: Date? = dateFormatter.date(from: self)
        
        return dateFormatterPrint.string(from: date!)
    }
}
