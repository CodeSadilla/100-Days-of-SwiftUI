//  iExpense
//
//  Created by Comet PC on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        AmountStyle(amount: item.amount)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct AmountStyle: View {
    let amount: Double
    var body: some View {
        let negativeAmount = Text(amount, format: ContentView().localCurrency)
            .background(.indigo)
        let smallAmount = Text(amount, format: ContentView().localCurrency)
            .background(.green)
        let mediumAmount = Text(amount, format: ContentView().localCurrency)
            .background(.yellow)
        let bigAmount = Text(amount, format: ContentView().localCurrency)
            .background(.red)
        let hugeAmount = Text(amount, format: ContentView().localCurrency)
            .background(.cyan)
        
        if amount < 0 {
            negativeAmount
        } else if amount >= 0 && amount < 10 {
            smallAmount
        } else if amount >= 10 && amount < 100 {
            mediumAmount
        } else if amount >= 100 && amount < 1000 {
            bigAmount
        } else if amount >= 1000 {
            hugeAmount
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
