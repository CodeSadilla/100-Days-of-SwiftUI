//
//  ContentView.swift
//  p7_iExpense4
//
//  Created by Comet PC on 3/27/23.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    @State private var tapCount = UserDefaults.standard.integer(forKey: "UserData")

    var body: some View {
        VStack {
            Button("Save User") {
                let encoder = JSONEncoder()

                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            .padding()
            Text(String(user.firstName + " " + user.lastName))
            Text(String(tapCount))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
