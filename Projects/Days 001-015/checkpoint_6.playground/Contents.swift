import Cocoa

struct Car {
    private let model:String = "MX-5 Miata"
    private let numberOfSeats:Int = 2
    private(set) var currentGear:Int = 1 {
        /*willSet {
            print("Shifting to gear \(newValue)...")
        }*/
        didSet {
            print("Shifted to gear \(currentGear)")
        }
    }
    mutating func changeGear(shift:Int) {
        let bottomGear = 1; let topGear = 10
        print("Attempting to shift...")
        if (currentGear + shift < bottomGear) { // Validate input
            print("Cannot shift below \(self.currentGear)st gear.")
            self.currentGear = bottomGear
        } else if (currentGear + shift > topGear) {
            if (topGear % 10 == 2) { // If topGear is 2nd, 22nd, etc.
                print("Cannot shift above \(topGear)nd gear.")
                self.currentGear = topGear
            } else if (topGear == 3 || topGear % 10 == 3) { // If topGear is 3rd, 33rd, etc.
                print("Cannot shift above \(topGear)rd gear.")
                self.currentGear = topGear
            } else {
                print("Cannot shift above \(topGear)th gear.")
                self.currentGear = topGear
            }
        } else {
            self.currentGear += shift
        }
    }
}
var car = Car()
print(car)

car.changeGear(shift:-1)
car.changeGear(shift: 5)
car.changeGear(shift: 33)

print(car)
