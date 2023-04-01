import Cocoa

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
class Dog: Animal {
    func speak() {
        print("Bark!")
    }
    init() {
        super.init(legs: 4)
    }
}
final class Corgi: Dog {
    override func speak() {
        print("Arf!")
    }
}
final class Poodle: Dog {
    override func speak() {
        print("Ruff!")
    }
}
class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("Meow!")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}
final class Persian: Cat {
    override func speak() {
        print("Nya!")
    }
}
final class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}
let corgi = Corgi()
let poodle = Poodle()
corgi.speak()
poodle.speak()

let persian = Persian(isTame: true)
let lion = Lion(isTame: false)
persian.speak()
lion.speak()
print(corgi.legs == 4)
