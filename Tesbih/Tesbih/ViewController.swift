//
//  ViewController.swift
//  Tesbih
//
//  Created by Semih Emre ÜNLÜ on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!

    @IBOutlet weak var countButton: UIButton!

    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
    }

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")

        count = 0
        showCount()
        print("SEM: refreshButtonTapped")
    }

    @IBAction func countButtonTapped(_ sender: Any) {

        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        print("Something")
        count += 1
        print("SEM:", count)
        showCount()
    }

    func showCount() {
        countLabel.text = "\(count)"
    }
}

