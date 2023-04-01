import Cocoa

extension Building {
    var building: String {
        rooms.contains("Master Bedroom") ? "House" : "Office"
    }
    func salesSummary() {
        print("""
                Sales summary for \(building):
                Rooms: (\(rooms.count)) \(rooms)
                Cost: $\(cost)
                Agent Name: \(agentName)
                """)
    }
}
protocol Building {
    var rooms: Set<String> { get }
    var cost: Int { get }
    var agentName: String { get }
    
    func salesSummary()
}
struct House: Building {
    let building = "House"
    let rooms: Set = ["Master Bedroom", "Master Bathroom", "Living Room", "Basement", "Attic", "Kids' Room"]
    let cost = 400_000
    let agentName = "Stevie McBusinessman"
    func printThis() {
        print("hello")
    }
}
struct Office: Building {
    let building = "Office"
    let rooms: Set = ["Lobby", "Work Area", "Break Room", "Bathroom"]
    let cost = 500_000
    let agentName = "Richie McRichman"
}

let houseSales = House()
houseSales.salesSummary()
print("\n")
let officeSales = Office()
officeSales.salesSummary()
