//
//  ExpenseItem.swift
//  Sharing an observed object with a new view
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
