import Foundation

func greetUser(name: String) -> String {
    return "Hello, \(name)!"
}
print(greetUser(name: "Nariman"))

var optionalName: String? = "Alice"
if let unwrappedName = optionalName {
    print("Unwrapped name is: \(unwrappedName)")
} else {
    print("Name is nil")
}

var age: Int? = nil
let defaultAge = age ?? 18
print("User age is: \(defaultAge)")



func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var firstNum = 5
var secondNum = 10
swapValues(&firstNum, &secondNum)
print("Swapped: firstNum = \(firstNum), secondNum = \(secondNum)")

func calculateAverage(_ numbers: Double...) -> Double {
    let total = numbers.reduce(0, +)
    return numbers.isEmpty ? 0.0 : total / Double(numbers.count)
}
print("Average:", calculateAverage(10.0, 20.0, 30.0, 40.0))

func processScore(_ score: Int?) {
    guard let validScore = score else {
        print("Invalid score provided")
        return
    }
    print("Valid score processing: \(validScore)")
}
processScore(85)
processScore(nil)


func applyOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let multiplyResult = applyOperation(6, 7) { $0 * $1 }
print("Multiplication result via closure:", multiplyResult)

class Student {
    var name: String
    var grade: Int?
    init(name: String, grade: Int? = nil) {
        self.name = name
        self.grade = grade
    }
}

let student: Student? = Student(name: "John", grade: 95)
if let currentGrade = student?.grade {
    print("\(student?.name ?? "Student") has grade: \(currentGrade)")
}

let scores = [45, 80, 92, 60, 30, 100]
let passingScores = scores.filter { $0 >= 60 }
print("Passing scores:", passingScores)
