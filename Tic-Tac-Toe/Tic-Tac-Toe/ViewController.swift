//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Batch-2 on 04/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var meggaesLabel: UILabel!
    
    enum Turn{
        case x
        case o
    }
    var player: Turn = .x
    var scoreArray = [0,0,0,0,0,0,0,0,0]
    var gameOver = false
    @IBOutlet var gridButtons: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard !gameOver else { return }
        
        if player == .x {
            sender.setImage(UIImage(systemName: "x.square"), for: .normal)
            scoreArray[sender.tag] = 1
            player = .o
        } else if player == .o {
            sender.setImage(UIImage(systemName: "o.square"), for: .normal)
            scoreArray[sender.tag] = -1
            player = .x
        }
        
        sender.isEnabled = false
        
        checkScore()
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        scoreArray = [0,0,0,0,0,0,0,0,0]
        player = .x
        gameOver = false
        
        for button in gridButtons {
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            button.isEnabled = true
        }
        meggaesLabel.text = "Player X's turn"
    }
    
    func checkScore() {
        let winCombinations = [
            (scoreArray[0] + scoreArray[1] + scoreArray[2]),
            (scoreArray[3] + scoreArray[4] + scoreArray[5]),
            (scoreArray[6] + scoreArray[7] + scoreArray[8]),
            (scoreArray[0] + scoreArray[3] + scoreArray[6]),
            (scoreArray[1] + scoreArray[4] + scoreArray[7]),
            (scoreArray[2] + scoreArray[5] + scoreArray[8]),
            (scoreArray[0] + scoreArray[4] + scoreArray[8]),
            (scoreArray[2] + scoreArray[4] + scoreArray[6])
        ]
        
        for combination in winCombinations {
            if combination == 3 {
                meggaesLabel.text = "Player X won!"
                gameOver = true
                disableAllButtons()
                return
            } else if combination == -3 {
                meggaesLabel.text = "Player O won!"
                gameOver = true
                disableAllButtons()
                return
            }
        }
        
        if !scoreArray.contains(0) {
            meggaesLabel.text = "It's a draw!"
            gameOver = true
            disableAllButtons()
        }
    }
    
    func disableAllButtons() {
        for button in gridButtons {
            button.isEnabled = false
        }
    }
}
