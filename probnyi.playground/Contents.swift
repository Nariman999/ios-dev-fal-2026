import Cocoa



/*      2
let studentName: String = "Adel"
var  subjects = ["Ios" , "web", "databese"]
subjects.append("dsh")

print(subjects)
print(subjects[1])

var dict: [String: Int] = ["Adel": 80, "Tima": 70, "Nari": 90 ]
dict.updateValue(100, forKey :"Adel")
print (dict)
print(dict ["Adel"]!)
*/


let group1: Set<String> =  ["Nari", "Adel", "Aisha"]
let group2:  Set<String> =  ["Nari", "Tima", "Adel"]

let inter = group1.intersection(group2)
print(inter)

var dict: [String: [Int]] = ["Adel": [90, 95, 80], "Nari": [90,85,95]]
print (dict ["Adel"]![0])
