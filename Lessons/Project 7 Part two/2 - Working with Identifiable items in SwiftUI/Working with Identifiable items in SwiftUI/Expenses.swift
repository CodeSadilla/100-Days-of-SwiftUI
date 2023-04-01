//
//  Expenses.swift
//  Working with Identifiable items in SwiftUI
//
//  Created by Comet PC on 3/27/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
