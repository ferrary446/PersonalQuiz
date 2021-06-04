//
//  Question.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 02.04.2021.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "What is your favorite food?",
                type: .single,
                answers: [
                    Answer(title: "Steak", type: .dog),
                    Answer(title: "Fish", type: .cat),
                    Answer(title: "Carrot", type: .rabbit),
                    Answer(title: "Corn", type: .turtle)
                ]
            ),
            Question(
                title: "What you like more?",
                type: .multiple,
                answers: [
                    Answer(title: "Swimming", type: .dog),
                    Answer(title: "Sleaping", type: .cat),
                    Answer(title: "Huging", type: .rabbit),
                    Answer(title: "Eating", type: .turtle)
                ]
            ),
            Question(
                title: "Do you like travel by car?",
                type: .ranged,
                answers: [
                    Answer(title: "Hate", type: .cat),
                    Answer(title: "Don't like", type: .rabbit),
                    Answer(title: "Like", type: .turtle),
                    Answer(title: "Very like", type: .dog)
                ]
            )
        ]
    }
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You enjoy being with your friends. You surround yourself with people you like and are always ready to help."
        case .cat:
            return "You are on your mind. Love to walk on your own. You value being alone."
        case .rabbit:
            return "You like everything soft. You are healthy and full of energy."
        case .turtle:
            return "Your strength lies in wisdom. Slow and thoughtful wins over long distances."
        }
    }
}
