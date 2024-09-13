import UIKit

// Step 1
var firstName: String = "Arsen"
var lastName: String = "Yelshan"
var age: Int = 20
let birthYear: Int = 2004
var isStudent: Bool = true
var height: Double = 1.79
var nationality: String = "Kazakh"
var favoriteFood: String = "Beshbarmaq"

var hobby: String = "🎨 Painting"
var numberOfHobbies: Int = 4
var favoriteNumber: Int = 7
var isHobbyCreative: Bool = true

var favoriteSport: String = "⚽ Football"
var likesTraveling: Bool = true


var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently \(isStudent ? "a student" : "not a student"). I enjoy \(hobby), which is a \(isHobbyCreative ? "creative" : "non-creative") hobby. I have \(numberOfHobbies) hobbies in total, including \(favoriteSport). My favorite number is \(favoriteNumber). I love eating \(favoriteFood), and I’m proud to be \(nationality).
"""

print(lifeStory)

var futureGoals: String = "In the future, I want to become a professional iOS developer. 🌟"
lifeStory += " " + futureGoals


print(lifeStory)
