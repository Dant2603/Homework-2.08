//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    var answersChosen: [Answer]?
    private var animalCounts: [Animal: Int] = [:]
    private var animals: [Animal] = []
            
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        guard let answers = answersChosen else {
               return
           }
        
        animals = answers.map {$0.animal}
        
        for animal in animals {
            animalCounts[animal, default: 0] += 1
        }
        
        let mostFrequentAnswer = animalCounts.max(by: {$0.value < $1.value})?.key
        
        if let mostFrequentAnimal = mostFrequentAnswer {
            answerLabel.text = "Вы - \(mostFrequentAnimal.rawValue)"
            definitionLabel.text = mostFrequentAnimal.definition
        }
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
