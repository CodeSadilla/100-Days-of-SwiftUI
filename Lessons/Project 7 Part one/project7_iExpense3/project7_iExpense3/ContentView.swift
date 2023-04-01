//
//  ContentView.swift
//  project7_iExpense3
//
//  Created by Comet PC on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
