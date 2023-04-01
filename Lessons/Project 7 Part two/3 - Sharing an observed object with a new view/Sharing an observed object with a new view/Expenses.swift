//
//  Expenses.swift
//  Sharing an observed object with a new view
//
//  Created by Comet PC on 3/27/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
