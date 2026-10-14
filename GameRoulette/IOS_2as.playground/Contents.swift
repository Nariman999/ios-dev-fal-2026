import Cocoa


var fruits = ["Apple", "Banana", "Orange", "Grape", "Peach"]
print("The third fruit is:", fruits[2])

var favoriteNumbers: Set<Int> = [7, 13, 21, 42]
favoriteNumbers.insert(99)
print("Updated set:", favoriteNumbers)

var programmingLanguages = [
    "Swift": 2014,
    "Python": 1991,
    "Java": 1995
]
print("Swift release year:", programmingLanguages["Swift"]!)

var colors = ["Red", "Green", "Blue", "Yellow"]
colors[1] = "Purple"
print("Updated colors array:", colors)



let set1: Set<Int> = [1, 2, 3, 4]
let set2: Set<Int> = [3, 4, 5, 6]
let intersectionSet = set1.intersection(set2)
print("Set intersection:", intersectionSet)


var studentScores = [
    "Temirlan": 85,
    "Adel": 100,
    "Nariman": 78
]
studentScores.updateValue(95, forKey: "Nariman")
print("Updated student scores:", studentScores)

let firstArray = ["apple", "banana"]
let secondArray = ["cherry", "date"]
let mergedArray = firstArray + secondArray
print("Merged array:", mergedArray)



var countryPopulations = [
    "Kazakhstan": 20000000,
    "Japan": 125000000
]
countryPopulations["Germany"] = 83000000
print("Updated country populations:", countryPopulations)

let setA: Set<String> = ["cat", "dog"]
let setB: Set<String> = ["dog", "mouse"]
let unionSet = setA.union(setB)
let finalSet = unionSet.subtracting(setB)
print("Final set after union and subtraction:", finalSet)

let studentGrades: [String: [Int]] = [
    "Nariman": [90, 85, 95],
    "Adel": [100, 98, 92]
]
print("Second grade for Adel:", studentGrades["Adel"]![1])
