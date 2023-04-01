//
//  Expenses.swift
//  Building a list we can delete from
//
//  Created by Comet PC on 3/27/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
