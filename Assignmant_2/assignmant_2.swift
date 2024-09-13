import UIKit

//Easy Tasks

//1
let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
print(fruits[2])

//2
var favoriteNumbers: Set = [3, 7, 11]
favoriteNumbers.insert(5)
print(favoriteNumbers)

//3
let programmingLanguages = ["Python": 1991, "Java": 1995, "Swift": 2014]
print(programmingLanguages["Swift"]!)

//4
var colors = ["Red", "Green", "Blue", "Yellow"]
colors[1] = "Purple"
print(colors)

//Medium Tasks

//1
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]
let intersection = set1.intersection(set2)
print(intersection)

//2
var studentScores = ["Alice": 85, "Bob": 90, "Charlie": 88]
studentScores["Bob"] = 95
print(studentScores)

//3
let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]
let mergedArray = array1 + array2
print(mergedArray)

//Hard Tasks

//1
var countryPopulations = ["USA": 331_000_000, "China": 1_400_000_000, "India": 1_380_000_000]
countryPopulations["Brazil"] = 212_000_000
print(countryPopulations)

//2
let animals1: Set = ["cat", "dog"]
let animals2: Set = ["dog", "mouse"]
let unionSet = animals1.union(animals2)
let finalSet = unionSet.subtracting(animals2)
print(finalSet)

//3
let studentGrades = ["Alice": [90, 85, 88], "Bob": [78, 82, 91], "Charlie": [92, 89, 84]]
print(studentGrades["Bob"]![1])


