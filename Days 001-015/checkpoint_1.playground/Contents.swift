import Cocoa

let celsius:Double = 30
var fahrenheit: Double {
    celsius * 9 / 5 + 32
}
print("The temp in Celsius is \(celsius)°. The temp in Fahrenheit is \(fahrenheit)°.")
