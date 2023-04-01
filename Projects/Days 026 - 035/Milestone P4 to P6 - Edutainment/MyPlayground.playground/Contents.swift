import Cocoa

let wizards1 = ["Harry", "Ron", "Hermione"]
let animals1 = ["Hedwig", "Scabbers", "Crookshanks"]
let combined1 = zip(wizards1, animals1)
print(combined1)
let combined2 = Array(zip(wizards1, animals1))
print(combined2)
print("\n")

let twoTimesTable = ["2 x 1": 2, "2 x 2": 4, "2 x 3": 6, "2 x 4": 8, "2 x 5": 10, "2 x 6": 12, "2 x 7": 14, "2 x 8": 16, "2 x 9": 18, "2 x 10": 20, "2 x 11": 22, "2 x 12": 24]
let threeTimesTable = ["3 x 1": 3, "3 x 2": 6, "3 x 3": 9, "3 x 4": 12, "3 x 5": 15, "3 x 6": 18, "3 x 7": 21, "3 x 8": 24, "3 x 9": 27, "3 x 10": 30, "3 x 11": 33, "3 x 12": 36]
let fourTimesTable = ["4 x 1": 4, "4 x 2": 8, "4 x 3": 12, "4 x 4": 16, "4 x 5": 20, "4 x 6": 24, "4 x 7": 28, "4 x 8": 32, "4 x 9": 36, "4 x 10": 40, "4 x 11": 44, "4 x 12": 48]
let fiveTimesTable = ["5 x 1": 5, "5 x 2": 10, "5 x 3": 15, "5 x 4": 20, "5 x 5": 25, "5 x 6": 30, "5 x 7": 35, "5 x 8": 40, "5 x 9": 45, "5 x 10": 50, "5 x 11": 55, "5 x 12": 60]
let sixTimesTable = ["6 x 1": 6, "6 x 2": 12, "6 x 3": 18, "6 x 4": 24, "6 x 5": 30, "6 x 6": 36, "6 x 7": 42, "6 x 8": 48, "6 x 9": 54, "6 x 10": 60, "6 x 11": 66, "6 x 12": 72]
let sevenTimesTable = ["7 x 1": 7, "7 x 2": 14, "7 x 3": 21, "7 x 4": 28, "7 x 5": 35, "7 x 6": 42, "7 x 7": 49, "7 x 8": 56, "7 x 9": 63, "7 x 10": 70, "7 x 11": 77, "7 x 12": 84]
print(twoTimesTable)
print("\n")
let myZip = zip(twoTimesTable, threeTimesTable)
print(myZip)
print("\n")
let myZip2 = Array(zip(twoTimesTable, threeTimesTable))
print(myZip2)
print("\n")

let range = 2...3
range.forEach { number in
    print(number)
}
print("\n")

range.forEach { number in
    myZip2.forEach { (wizard, animal) in
        if ("\(number) x 1" == "\(wizard.key)") {
            print("i'm a potato")
        }
        if ("2 x 1" == String(wizard.key) || "3 x 1" == String(animal.key)) {
            print("success")
        }
        if (number + 1 == wizard.value || number == wizard.value) {
            print("successV2")
        }
//        print(wizard.key)
//        print(wizard.value)
//        print("\(wizard) has \(animal)")
    }
}
print("\n")
range.forEach { number in
    myZip2.forEach { twoTimesTable, threeTimesTable in
        for table in [twoTimesTable, threeTimesTable] {
            if ("\(number) x 1" == "\(table.key)") {
                print(table.key)
            }
        }
        if ("\(number) x 1" == "\(twoTimesTable.key)") {
            print("i'm a potato")
            print("\(myZip2.randomElement()?.0.key ?? "1 x 1")")
            print("\(myZip2[0])")
            print("\(myZip2[0].0)")
        }
        if ("\(number) x 1" == "\(threeTimesTable.key)") {
            print("i'm a tomato")
        }
    }
}
print("\n")
var parameter2: KeyPath<(String, String, String), String> = \.0
let tuple = ("banana", "sock", "shoe")
print(tuple[keyPath: parameter2])

var parameter5: KeyPath<([String]), String> = \.[0]
let array = ["cat", "dog"]
print(array[keyPath: parameter5])
let array2 = [["mouse", "rat"], ["zebra", "donkey"]]
var parameter7: KeyPath<[[String]], [String]> = \.[0]
var parameter8: KeyPath<([[String]]), [String]> = \.[0]
print(array2[keyPath: parameter7])
//print(array2[keyPath: parameter7]!)
// let myZip2 = Array(zip(twoTimesTable, threeTimesTable))
//print(twoTimesTable[0].key!)
//var parameter6: KeyPath<([String: Int]), (key: String, value: Int)> = \[0].key: \[0].value)
//let names = array.map { $0.name }
//let names = array.map(\.name)
//var parameter4: KeyPath<[((String), (String))], String> = \.[0]
//
//var parameter3: KeyPath<([(String, String)]), (String, String)> = (\.0, \.1)
//print(combined2[keyPath: parameter3]!)

var parameter: KeyPath<((key: String, value: Int), (key: String, value: Int)), (key: String, value: Int)> = \.0
print(myZip2.randomElement()![keyPath: parameter])
print("\n")

let allTimesTablez = [twoTimesTable, threeTimesTable, fourTimesTable, fiveTimesTable, sixTimesTable, sevenTimesTable]
let allTimesTablesMegaZip = Array(zip(twoTimesTable, zip(threeTimesTable, zip(fourTimesTable, zip(fiveTimesTable, zip(sixTimesTable, sevenTimesTable))))))
print(allTimesTablez)
print("\n")
print(array)
print("\n")
var parameter9: KeyPath<[[String: Int]], [String: Int]> = \.[0]
var parameter10: KeyPath<[[String: Int]], [String: Int]> = \.[1]
var parameter11: KeyPath<[[String: Int]], [String: Int]> = \.[2]

var parameter6: KeyPath<([String: Int], [String: Int], [String: Int]), [String: Int]> = \.0
print(allTimesTablez[keyPath: parameter9].randomElement()!.key)
print(allTimesTablez[keyPath: parameter10].randomElement()!)
print(allTimesTablez[keyPath: parameter11].randomElement()!)
print("\n")

let times1 = Array(["1 x 1": 1])
print(times1[0].key)

func yoloTables() -> String {
    let myTimesTables = Array(zip(twoTimesTable, threeTimesTable))
    let difficulty = 2
    let difficultyRange1 = 0...1
    var matchingTimes = "unknown"
    var parameter: KeyPath<((key: String, value: Int), (key: String, value: Int)), (key: String, value: Int)> = \.0
    var parameter1: KeyPath<((key: String, value: Int), (key: String, value: Int)), (key: String, value: Int)> = \.1
    let parameterArray = [parameter, parameter1]
    for (twoTimesTable, threeTimesTable) in myTimesTables {
        for table in [twoTimesTable, threeTimesTable] {
            for i in difficultyRange1 {
                if ("\(difficulty) x 1" == "\(table.key)" && difficulty == i + 2) {
                    matchingTimes = myTimesTables.randomElement()?[keyPath: parameterArray[i]].key ?? "1 x 1"
                    return matchingTimes
                }
            }
        }
    }
    func whatever() -> String {
        let allTimesTables = [twoTimesTable, threeTimesTable, fourTimesTable, fiveTimesTable, sixTimesTable, sevenTimesTable]
        let difficultyTestRange = 2...7
        var matchingTimes = "unknown"

        var parameter: KeyPath<[[String: Int]], [String: Int]> = \.[0]
        var parameter1: KeyPath<[[String: Int]], [String: Int]> = \.[1]
        var parameter2: KeyPath<[[String: Int]], [String: Int]> = \.[2]
        var parameter3: KeyPath<[[String: Int]], [String: Int]> = \.[3]
        var parameter4: KeyPath<[[String: Int]], [String: Int]> = \.[4]
        var parameter5: KeyPath<[[String: Int]], [String: Int]> = \.[5]
        var parameter6: KeyPath<[[String: Int]], [String: Int]> = \.[6]
        let parameterArray = [parameter, parameter1, parameter2, parameter3, parameter4, parameter5, parameter6]
        
        for table in allTimesTables {
            for questionAnswerPair in table {
                for i in difficultyTestRange {
                    if ("\(difficulty) x 1" == "\(questionAnswerPair.key)" && difficulty == i) {
                        matchingTimes = allTimesTables[keyPath: parameterArray[i - 2]].randomElement()!.key
                        return matchingTimes
                    }
                }
            }
        }
        return matchingTimes
    }
    return matchingTimes
}
