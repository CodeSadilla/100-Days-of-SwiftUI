import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var showingAlert = false
    
    @State private var bedtime = defaultWakeTime - (8.0 * 60 * 60)
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("When do you want to wake up?").font(.headline)) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section(header: Text("Desired amount of sleep").font(.headline)) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section(header: Text("Daily coffee intake").font(.headline)) {
                    Picker("Cup(s) of coffee", selection: $coffeeAmount) {
                        ForEach(1...1, id: \.self) {
                            Text("\($0) cup")
                        }
                        ForEach(2...20, id: \.self) {
                            Text("\($0) cups")
                        }
                    }
                }
                Section {
                    VStack {
                        Text("Recommended bedtime:").font(.title2).bold()
                        HStack {
                            Spacer()
                            Text("\(calculateBedtime()) ⏳")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
