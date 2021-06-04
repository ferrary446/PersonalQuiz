//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Ilya Yushkov on 02.06.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var typeIconLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var arrayOfAnswer: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
    }
    
}

extension ResultsViewController {
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = arrayOfAnswer.map { $0.type }
        
        for animal in animals {
            
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)

    }
    
    private func updateUI(with animal: AnimalType?) {
        typeIconLabel.text = "You - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
