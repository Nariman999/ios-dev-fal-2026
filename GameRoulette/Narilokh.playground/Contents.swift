import Foundation

let firstName: String = "Nariman"
let lastName: String = "Bakitbekov"
let birthYear: Int = 2007
let currentYear: Int = 2026
let age: Int = currentYear - birthYear
let isStudent: Bool = true
let height: Double = 1.75

let hobby: String = "football"
let numberOfHobbies: Int = 3
let favoriteNumber: Int = 7
let isHobbyCreative: Bool = true

let futureGoals: String = "In the future, I want to become a successful software engineer and iOS developer 💻."
let city: String = "Almaty"

let lifeStory = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear) and live in \(city).
Currently, I am a student: \(isStudent). My height is \(height) meters.
I enjoy \(hobby), which is a creative hobby (\(isHobbyCreative)).
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
\(futureGoals)
"""

print(lifeStory)
