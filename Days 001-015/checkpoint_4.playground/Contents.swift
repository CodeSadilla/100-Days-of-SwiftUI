import Cocoa
import Foundation

let myNumber = 0

enum ErrorList: Error {
    case outOfBounds, noRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if (number < 1 || number > 10_000) {
        throw ErrorList.outOfBounds
    }
    for i in 1...(100) {
        if (i * i == number) {
            return i
        }
    }
    throw ErrorList.noRoot
}

do {
    print("The square root of \(myNumber) is \(try squareRoot(myNumber)).")
} catch ErrorList.outOfBounds {
    print("\(myNumber) is out of bounds.")
} catch ErrorList.noRoot {
    print("No integer root.")
} catch {
    print("There was an error.")
}
