//
//  Item.swift
//  SwiftUI-Template-MVVM
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import Foundation

/// This extends the CoreData Managed Object
/// Use this to add any custom methods or computed properties to the Item object
extension Item {
    
    /// Example of custom method
    func printItem() {
        if let id = self.id {
            print("--- #\(id.uuidString)")
            print("value: \(self.value)")
            print("--- END ---")
        }
    }
    
    /// Example of computed method
    var isValueLowerThanFive: Bool {
        return value < 5
    }
}
