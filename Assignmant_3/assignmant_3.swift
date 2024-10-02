import UIKit

//Pr 1
for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}

//Pr 2
func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for i in 1...100 {
    if isPrime(i) {
        print(i)
    }
}

//Pr 3
func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}


//Pr 4
var shoppingList: [String] = []

func addItem(_ item: String) {
    shoppingList.append(item)
}

func removeItem(_ item: String) {
    if let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
    }
}

func displayList() {
    print("Your shopping list:")
    for item in shoppingList {
        print("- \(item)")
    }
}


//Pr 5
var wordFrequencies: [String: Int] = [:]

func countWords(_ sentence: String) {
    let words = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters.union(.whitespaces))
    
    for word in words where !word.isEmpty {
        wordFrequencies[word, default: 0] += 1
    }
}

//Pr 6
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    var sequence = [0, 1]
    
    while sequence.count < n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }
    
    return sequence
}

//Pr 7

var students: [(name: String, score: Int)] = [
    ("John", 85),
    ("Anna", 92),
    ("Tom", 78),
    ("Sara", 88),
    ("Mark", 95)
]

func calculateAverage(students: [(name: String, score: Int)]) -> Double {
    let totalScore = students.reduce(0) { $0 + $1.score }
    return Double(totalScore) / Double(students.count)
}

func findHighestScore(students: [(name: String, score: Int)]) -> (name: String, score: Int) {
    return students.max { a, b in a.score < b.score }!
}

func findLowestScore(students: [(name: String, score: Int)]) -> (name: String, score: Int) {
    return students.min { a, b in a.score < b.score }!
}

let averageScore = calculateAverage(students: students)
print("Average Score: \(averageScore)")

let highestScore = findHighestScore(students: students)
let lowestScore = findLowestScore(students: students)

print("Highest Score: \(highestScore.name) with \(highestScore.score)")
print("Lowest Score: \(lowestScore.name) with \(lowestScore.score)")

for student in students {
    let status = student.score >= Int(averageScore) ? "above" : "below"
    print("\(student.name) scored \(student.score), which is \(status) the average.")
}

//Pr 8
func isPalindrome(_ text: String) -> Bool {
    let filteredText = text.lowercased().filter { $0.isLetter }
    return filteredText == String(filteredText.reversed())
}

//Pr 9
func add(_ a: Double, _ b: Double) -> Double { return a + b }
func subtract(_ a: Double, _ b: Double) -> Double { return a - b }
func multiply(_ a: Double, _ b: Double) -> Double { return a * b }
func divide(_ a: Double, _ b: Double) -> Double { return a / b }

//Pr 10
func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet = Set<Character>()
    
    for char in text {
        if characterSet.contains(char) {
            return false
        }
        characterSet.insert(char)
    }
    return true
}
