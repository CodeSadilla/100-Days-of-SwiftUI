import Cocoa

func myFunc(myArray: [Int]?) -> Int { myArray?.randomElement() ?? Int.random(in: 1...100) }
print(myFunc(myArray: [-1, -4, -2, -6, 0]))
