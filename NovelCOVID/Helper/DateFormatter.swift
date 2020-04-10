//
//  DateFormatter.swift
//  NovelCOVID
//
//  Created by Developer Bully on 10/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation

extension String {
  func toDate(withFormat format: String = "m/dd/yy") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX

    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}

extension Date {

func toString(format: String = "m/dd/yy") -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX

    return formatter.string(from: self)
}
    
    func toStringLabel(format: String = "MMM d") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return formatter.string(from: self)
    }
}
