//
//  extension.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String {
        
        let formatter = DateFormatter()
        let calendar = Calendar.current
        if calendar.isDateInToday(self){
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        } else {
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
        }
       
        
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: self)
    }
    
}
