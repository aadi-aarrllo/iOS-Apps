//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Batch-2 on 15/04/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]){
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1 }.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLable.text = mostCommonAnswer.definition
    }
    
}
