import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0
    @State private var inputUnit = Units.seconds
    @State private var outputUnit = Units.minutes
    @FocusState private var isFocused: Bool
    
    enum Units: String, CaseIterable {
        case seconds, minutes, hours, days
        var name: String {
            return rawValue.capitalized
        }
    }
    
    var conversion: Double {
        let castedInputNumber = Double(inputNumber)
        var seconds: Double
        
        // Convert casted inputNumber to a base unit.
        switch inputUnit {
        case .minutes:
            seconds = castedInputNumber * 60.0
        case .hours:
            seconds = castedInputNumber * 60 * 60
        case .days:
            seconds = castedInputNumber * 60 * 60 * 24
        default:
            seconds = castedInputNumber
        }
        
        // Convert base unit to input unit.
        switch outputUnit {
        case .minutes:
            return seconds / 60
        case .hours:
            return seconds / 60 / 60
        case .days:
            return seconds / 60 / 60 / 24
        default:
            return seconds
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Input Unit
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(Units.allCases, id: \.self) { unit in
                            Text(unit.name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Input Unit")
                }
                
                // Output Unit
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(Units.allCases, id: \.self) { unit in
                            Text(unit.name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Output Unit")
                }
                
                // Input Number (get user input)
                Section {
                    TextField("Amount", value: $inputNumber, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                } header: {
                    Text("Input Number")
                }
                
                // Output Number
                Section {
                    Text(conversion.formatted())
                } header: {
                    Text("Output Number")
                }
            }
            .navigationTitle("Convert Units")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
