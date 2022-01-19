//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet var digitButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var userIsTyping = false

    private var brain = CalculatorBrain()

    var result: Double {
        get {
            return Double(resultLabel.text ?? "0.0") ?? 0.0
        }
        set {
            resultLabel.text = String(newValue)
        }
    }

    @IBAction func digitButtonTapped(_ sender: UIButton) {
        if userIsTyping {
            var resultText = String(Int(result))
            resultText = resultText + String(sender.tag)
            result = NSString(string: resultText).doubleValue
        } else {
            result = Double(sender.tag)
            userIsTyping.toggle()
        }
    }

    @IBAction func operationButtonTapped(_ sender: UIButton) {
        userIsTyping = false
        brain.setOperand(result)
        brain.performOperation(sender.titleLabel?.text ?? "")
        result = brain.result
    }
}

