//
//  ViewController.swift
//  QuizzApp
//
//  Created by Bruno Nascimento Marques on 01/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    var quizBrain = QuizBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let selectedAnswer = sender.currentTitle
        let isCorrect = quizBrain.checkAnswer(selectedAnswer: selectedAnswer!)
        
        if isCorrect == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.score)"
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].text
        answer1.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[0], for: .normal)
        answer2.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[1], for: .normal)
        answer3.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[2], for: .normal)
        // Agora tenho que criar um DispatchQueue, pois senão os botões vão ficar semrpe coloridos, com o DispatchQueue, posso fazer com eles voltem a cor padrão depois de um certo tempo.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.answer1.backgroundColor = UIColor.clear
            self.answer2.backgroundColor = UIColor.clear
            self.answer3.backgroundColor = UIColor.clear
        })
    }
}

