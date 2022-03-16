//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet private weak var whatIsAnimalLabel: UILabel!
    @IBOutlet private weak var yourHobbiesLabel: UILabel!
    
    var answers: [Answer] = []
    
    private var dictionaryAnswer: [Animal: Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setAnswerInLabels()
    }
    
    private func getDictionaryAnswer() -> [Dictionary<Animal, Int>.Element] {
        for answer in answers {
            if let animalCount = dictionaryAnswer[answer.animal] {
                dictionaryAnswer.updateValue(animalCount + 1, forKey: answer.animal)
            } else {
                dictionaryAnswer[answer.animal] = 1
            }
        }
        
        let sortedDictionaryAnswer = dictionaryAnswer.sorted { $0.value > $1.value }
        return sortedDictionaryAnswer
    }
    
    private func setAnswerInLabels() {
        guard let emoji = getDictionaryAnswer().first?.key.rawValue else { return }
        
        whatIsAnimalLabel.text = "Вы - \(emoji)!"
        yourHobbiesLabel.text = getDictionaryAnswer().first?.key.definition
    }
}
