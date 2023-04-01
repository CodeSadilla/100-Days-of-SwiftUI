//
//  ExpenseItem.swift
//  Working with Identifiable items in SwiftUI
//
//  Created by Comet PC on 3/27/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
