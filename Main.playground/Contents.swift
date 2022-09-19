// Swiftbook Основы

// Константы и переменные

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y =  0.0, z = 0.0

// Анотация типов

var welcomeMessage: String

welcomeMessage = "Hello"

var red, green, blue: Double

// Печать констант и переменных

let friendWelcomeText = "Hello friend!"

print(friendWelcomeText)

print("Текущее значение friendWelcomeText равно \(friendWelcomeText)") // Интерполяция строк

// Коментарии

// это коментарий
/*
 это тоже коментарий написанный на двух
 строках
 */

// Целые числа

let minValueOfUInt8 = UInt8.min
let maxValueOfUInt8 = UInt8.max

// Преобразования числовых типов

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

print(pi)

// Псевдонимы типов

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// Логические типы

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let someNumber = 1

if someNumber == 1 {
    print("someNumber is - 1")
}

// Кортежи

let http404Error = (404, "Not Found")
// http404Eror имеет тип (Int, String), и равен (404, Not Found)


let (statusCode, statusMessage) = http404Error

print(statusCode)
print(statusMessage)

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// Опциональные типы (опционалы)

let possibleNumber = "123aaa"
let convertedNumber = Int(possibleNumber)
// для convertedNumber выведен тип "Int?"

print(type(of: convertedNumber))

var serverResponseCode: Int? = 404

serverResponseCode = nil

// Инструкция if и принудительное извлечение

if convertedNumber != nil {
    print("convertedNumber contains some integer number")
}

if convertedNumber != nil {
    print("convertedNumber is - \(convertedNumber!)")
}

// Привязка опционалов

if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an ineger value of \(actualNumber)")
} else {
    print("\(possibleNumber) could not be converted to an ineger")
}

if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
   firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// Неявно извлеченные опционалы

let possibleString: String? = "An optional string"
let forcedString: String = possibleString! // необходим восклицательный знак

let assumedString: String! = "An implictly unwrapped optional string"
let implicitString: String = assumedString

print(forcedString)
print(implicitString)

// Обработка ошибок

func canThrowAnError() throws {
    // эта функция может сгенерировать ошибку
}

do {
    try canThrowAnError()
    // ошибка не была сгенерирована
} catch {
    // ошибка сгенерирована
}

class Player {
    
    let name: String
    let game: String
    let age: Int
    
    var playerInfo: String {
        let playerInfo = """
            Player name is \(name)
            Player game is \(game)
            Player age is \(age)
"""
        return playerInfo
    }
    
    init(name: String, game: String, age: Int) {
        self.name = name
        self.game = game
        self.age = age
    }
}

let player = Player(name: "Abylay", game: "Football", age: 21)
print(player.playerInfo)

class ProfessionalPlayer: Player {
    let expirience: Int
    let retirmentAge: Int
    
    init(name: String, game: String, age: Int, expirience: Int, retirmentAge: Int) {
        self.expirience = expirience
        self.retirmentAge = retirmentAge
        super.init(name: name, game: game, age: age)
    }
}

let proPlayer = ProfessionalPlayer(name: "Misha", game: "Tenis", age: 23, expirience: 5, retirmentAge: 35)

proPlayer.playerInfo

protocol PolitePlayer {
    var friends: [Player] { get }
    var haveAFriend: Bool { get }
    
    func smile()
    func apologize() -> String
}

extension ProfessionalPlayer: PolitePlayer {
    var friends: [Player] {
        return [Player(name: "Alex", game: "Footbal", age: 19)]
    }
    
    var haveAFriend: Bool {
        return !friends.isEmpty
    }
    
    func smile() {
        print("Lets smile together")
    }
    
    func apologize() -> String {
        return "sorry friend"
    }
    
    
}
