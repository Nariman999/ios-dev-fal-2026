
import Foundation

// MARK: - =================== STARTER DATA ===================
// MARK: - Do not modify anything in this section[cite: 6]

/// Drone records recovered from the fleet registry.
/// One `kind` does not correspond to any drone type you will build.[cite: 6]
let fleetData: [(kind: String, id: String, charge: Int)] = [
    (kind: "welder",  id: "W-1", charge: 80),
    (kind: "scanner", id: "S-1", charge: 45),
    (kind: "cargo",   id: "C-1", charge: 100),
    (kind: "welder",  id: "W-2", charge: 15),
    (kind: "scanner", id: "S-2", charge: 60),
    (kind: "tug",     id: "T-1", charge: 50)
]

/// Hull sensors. These are NOT drones — they never move and never work a shift.[cite: 6]
let sensorData: [(id: String, charge: Int)] = [
    (id: "hull-cam", charge: 12),
    (id: "thermal",  charge: 77)
]

/// Hardware from the original station. You may not add anything to this
/// declaration — no methods, no protocols, no properties.[cite: 6]
struct LegacyBeacon {
    let name: String
    let signalStrength: Int
}

let beacon = LegacyBeacon(name: "ALMA-BEACON", signalStrength: 8)

print("Fleet registry online: \(fleetData.count) drone records, \(sensorData.count) sensors, beacon \(beacon.name).")

// MARK: - ================= END OF STARTER DATA =================


// MARK: - =================== YOUR SOLUTION ===================

// MARK: Level 1 · The Power Cell[cite: 6]

// Why a class and not a struct here?  ->
// PowerCell is a reference type so multiple entities (e.g., drone components) share and observe the exact same mutable battery state.[cite: 1, 2]
final class PowerCell {
    private var charge: Int
    
    init(charge: Int) {
        if charge < 0 {
            self.charge = 0
        } else if charge > 100 {
            self.charge = 100
        } else {
            self.charge = charge
        }
    }
    
    func level() -> Int {
        return charge
    }
    
    func spend(amount: Int) -> Bool {
        if amount <= 0 || charge < amount {
            return false
        }
        charge -= amount
        return true
    }
    
    func recharge(by amount: Int) {
        if amount <= 0 { return }
        charge += amount
        if charge > 100 {
            charge = 100
        }
    }
}

// Encapsulation proof (leave this commented, with the compiler error):[cite: 2, 6]
// let testCell = PowerCell(charge: 50)
// testCell.charge = 100
// error: 'charge' is inaccessible due to 'private' protection level[cite: 11]


// MARK: Level 2 · The Fleet[cite: 6]

// 2.1 What does `final` on runOnce() buy you?  ->[cite: 2, 6]
// Marking runOnce() final prevents subclasses from overriding the core shift logic and bypassing energy checks.[cite: 2, 17]
class Drone {
    let id: String
    let cell: PowerCell
    
    init(id: String, cell: PowerCell) {
        self.id = id
        self.cell = cell
    }
    
    var powerCost: Int { 10 }
    
    var statusLine: String {
        return "\(id): \(cell.level().powerBar)"
    }
    
    func performTask() -> Int { 0 }
    
    final func runOnce() -> Int {
        if !cell.spend(amount: powerCost) {
            return 0
        }
        return performTask()
    }
}

// 2.2 Subclasses
final class WelderDrone: Drone {
    override var powerCost: Int { 25 }
    override func performTask() -> Int { 40 }
    func weldSeam() -> String { "Welding seam..." }
}

class ScannerDrone: Drone {
    override var powerCost: Int { 10 }
    override func performTask() -> Int { 15 }
    override var statusLine: String {
        return super.statusLine + " [scanner]"
    }
}

final class CargoDrone: Drone {
    override var powerCost: Int { 20 }
    override func performTask() -> Int { 25 }
}

// 2.3 Factory
func makeDrone(kind: String, id: String, charge: Int) -> Drone? {
    let cell = PowerCell(charge: charge)
    if kind == "welder" {
        return WelderDrone(id: id, cell: cell)
    } else if kind == "scanner" {
        return ScannerDrone(id: id, cell: cell)
    } else if kind == "cargo" {
        return CargoDrone(id: id, cell: cell)
    } else {
        return nil
    }
}

var fleet: [Drone] = []
for record in fleetData {
    if let drone = makeDrone(kind: record.kind, id: record.id, charge: record.charge) {
        fleet.append(drone)
    } else {
        print("WARNING: Skipped unknown drone record kind: '\(record.kind)' (ID: \(record.id))")
    }
}


// MARK: Level 3 · The Shift[cite: 3, 6]

func runShift(_ fleet: [Drone], rounds: Int) -> Int {
    var totalWork = 0
    for _ in 0..<rounds {
        for drone in fleet {
            totalWork += drone.runOnce()
        }
    }
    return totalWork
}

let A = runShift(fleet, rounds: 3)

print("\n--- Post-Shift Drone Status ---")
var B = 0
var C = 0

for drone in fleet {
    print(drone.statusLine)
    let currentCharge = drone.cell.level()
    B += currentCharge
    if currentCharge >= drone.powerCost {
        C += 1
    }
}

print("Total Work Units (A): \(A)")
print("Total Remaining Charge (B): \(B)")
print("Ready Drones Count (C): \(C)")


// MARK: Level 4 · Diagnostics[cite: 3, 6]

// 4.1 Protocols
protocol Diagnosable {
    var componentID: String { get }
    var statusCode: Int { get }
    func diagnose() -> String
}

protocol Rechargeable {
    mutating func recharge(by amount: Int)
}

// 4.2 Drone & SensorModule Conformance[cite: 3, 6]
// Why does Drone implement recharge(by:) without `mutating`?  ->
// Drone is a class (reference type), and class methods inherently modify instance state without needing the mutating keyword.[cite: 1, 26]
extension Drone: Diagnosable, Rechargeable {
    var componentID: String { id }
    var statusCode: Int {
        return HealthRule.calculateStatusCode(for: cell.level())
    }
    func recharge(by amount: Int) {
        cell.recharge(by: amount)
    }
}

struct SensorModule: Diagnosable, Rechargeable {
    let id: String
    var chargeLevel: Int
    
    var componentID: String { id }
    var statusCode: Int {
        return HealthRule.calculateStatusCode(for: chargeLevel)
    }
    
    mutating func recharge(by amount: Int) {
        if amount <= 0 { return }
        chargeLevel += amount
        if chargeLevel > 100 {
            chargeLevel = 100
        }
    }
}

var sensors: [SensorModule] = []
for data in sensorData {
    sensors.append(SensorModule(id: data.id, chargeLevel: data.charge))
}

// 4.3 Diagnostics Screen
// Why could [Drone] never have held the sensors?  ->
// SensorModule is a struct and doesn't inherit from Drone class, whereas [Diagnosable] can hold both classes and structs.[cite: 1, 3, 21]
func diagnosticsReport(_ components: [Diagnosable]) -> String {
    var report = "=== DIAGNOSTICS REPORT ===\n"
    for item in components {
        report += item.diagnose() + "\n"
    }
    return report
}


// MARK: Level 5 · Shared Behaviour[cite: 3, 6]

// 5.1 Single home of the Health Rule[cite: 1, 3]
struct HealthRule {
    static func calculateStatusCode(for value: Int) -> Int {
        if value < 20 {
            return 2
        } else if value <= 49 {
            return 1
        } else {
            return 0
        }
    }
}

extension Diagnosable {
    func diagnose() -> String {
        return "[\(componentID)]: code \(statusCode)"
    }
}

// 5.2 Legacy Beacon Extension
extension LegacyBeacon: Diagnosable {
    var componentID: String { name }
    var statusCode: Int {
        return HealthRule.calculateStatusCode(for: signalStrength)
    }
    func diagnose() -> String {
        return "[LEGACY BEACON] \(componentID): code \(statusCode)"
    }
}

// Prepare all Diagnosable components array
var allComponents: [Diagnosable] = []
for drone in fleet {
    allComponents.append(drone)
}
for sensor in sensors {
    allComponents.append(sensor)
}
allComponents.append(beacon)

print("\n" + diagnosticsReport(allComponents))

var D = 0
for comp in allComponents {
    D += comp.statusCode
}

// 5.3 Int Extension[cite: 4]
extension Int {
    var powerBar: String {
        var blocks = self / 10
        if blocks < 0 { blocks = 0 }
        if blocks > 10 { blocks = 10 }
        
        var bar = ""
        for i in 0..<10 {
            if i < blocks {
                bar += "#"
            } else {
                bar += "."
            }
        }
        return bar
    }
}


// MARK: Level 6 · Incident Reports[cite: 4, 6]

/*
Report 1:
- Expectation: Override performTask() in subclass.
- Actual: Fails to compile because performTask() in Drone is not marked final, but missing 'override' keyword in subclass.
- Language Rule: Subclasses overriding superclass methods must explicitly use the 'override' keyword.
- Fix: Add 'override' before 'func performTask()'.

Report 2:
- Expectation: Subclass HeavyWelder to override runOnce().
- Actual: Fails to compile.
- Language Rule: WelderDrone is marked 'final', preventing subclassing. Also 'runOnce()' is final in Drone, preventing overrides.
- Fix: Remove 'final' from parent declarations or avoid inheritance/overriding on final types/methods.

Report 3:
- Expectation: Access weldSeam() on a Drone element.
- Actual: Fails to compile because 'first' is typed as 'Drone', which lacks 'weldSeam()'.
- Language Rule: The compiler only allows calling methods declared on the static type (Drone).
- Fix: Conditional cast `if let welder = first as? WelderDrone { print(welder.weldSeam()) }`.
  Why `as?` returns an optional: The runtime cast may fail if the object is a different subclass, returning `nil`.

Report 4:
- Expectation: Dynamic dispatch calls Thruster's label().
- Actual: Compiles but prints "generic component".
- Language Rule: Direct implementation in protocol extensions without declaring the method in the main protocol requirement leads to static dispatch based on the existential type (Labelled).
- Fix: Add `func label() -> String` inside the `protocol Labelled` declaration.
*/


// MARK: Finale · Mission Code[cite: 5, 6]

let missionCode = "\(A)-\(B)-\(C)-\(D)"
print("MISSION CODE: \(missionCode)")


// MARK: - ================= DEFENSE QUESTIONS =================[cite: 5, 6]
/*
 1. Why does a class satisfy a `mutating` protocol requirement without the keyword, while a struct must write it?
    -> Classes are reference types; their methods modify internal memory without changing the object reference itself. Structs are value types, so modifying properties mutates the value, requiring explicit `mutating` annotation.[cite: 1, 26]

 2. One thing inheritance does that protocols cannot, and one thing protocols do that inheritance cannot:
    -> Inheritance allows sharing implementation logic and stored properties down a single hierarchy, while protocols allow completely unrelated types (both structs and classes) to conform to a shared interface.[cite: 1, 3, 13]

 3. What does `final` prevent, and what did it protect in runOnce()?
    -> `final` prevents method overriding and class inheritance. Protecting `runOnce()` ensures subclasses cannot tamper with energy deduction logic while defining custom work.[cite: 2, 17]

 4. In Report 4, why did the protocol extension's method win?
    -> `label()` was not declared in the protocol definition itself, so Swift used static dispatch based on the existential protocol type (`Labelled`) rather than dynamic dispatch for `Thruster`.[cite: 4, 5]
*/
