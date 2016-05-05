//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jared Allen on 1/14/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var player = 1 // 1 = O 2 = X
    var gameActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal wins
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical wins
        [0, 4, 8], [2, 4, 6] // Diagonal wins
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverLabel.alpha = 0
        //gameOverLabel.hidden = true
        //gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.alpha = 0
        // playAgainButton.hidden = true
        // playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && gameActive == true {
            
            gameState[sender.tag] = player
            
            if player == 1 {
                sender.setImage(UIImage(named: "O.png"), forState: .Normal)
                player = 2
                
                
            } else {
                sender.setImage(UIImage(named: "X.png"), forState: .Normal)
                player = 1
             
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    if gameState[combination[0]] == 1 {
                        gameOverLabel.text = "O Wins!"
                    
                    } else {
                        gameOverLabel.text = "X Wins!"
                    
                    }
                    gameOver()
                }
                
            }
            
            if gameActive == true {
                gameActive = false
                for buttonState in gameState {
                    if buttonState == 0 {
                        gameActive = true
                        
                    }
                    
                }
                if gameActive == false {
                    gameOverLabel.text = "It's a draw!"
                    gameOver()
                }
            }
        }
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        gameOverLabel.alpha = 0
        playAgainButton.alpha = 0
        
        var buttonToClear: UIButton
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    
    func gameOver() {
        // gameOverLabel.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            // self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            self.gameOverLabel.alpha = 1
        })
        
        // playAgainButton.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            // self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
            self.playAgainButton.alpha = 1
        })

        
    }
    

}

