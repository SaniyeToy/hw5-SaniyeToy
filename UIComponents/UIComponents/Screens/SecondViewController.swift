//
//  SecondViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 25.12.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configureNavigationBar()
    }

    func configureNavigationBar() {
//        let navigationBar = UINavigationBar.appearance()
//        navigationBar.backItem?.title = "Geri gel"
        self.navigationItem.backButtonTitle = "Geri gel"
        self.title = "SecondVC"

        let rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(logout(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc func logout(_ sender: UIBarButtonItem) {

    }

    @IBAction func presentFirstButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        firstViewController.modalPresentationStyle = .pageSheet
        firstViewController.modalTransitionStyle = .crossDissolve
        self.present(firstViewController, animated: true, completion: nil)
    }


    @IBAction func showFirstButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        self.navigationController?.show(firstViewController, sender: nil)
        self.navigationController?.pushViewController(firstViewController, animated: true)
    }

    @IBAction func popViewButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func popToRootButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func showSecondButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    @IBAction func presentSecondNavButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        let navigationController = UINavigationController(rootViewController: secondViewController)
        self.navigationController?.present(navigationController, animated: true, completion: nil)
    }

    @IBAction func dismissNavigationButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let destinationVC = segue.destination as? ViewController else { return }
        
        switch segue.identifier {
        case "presentFirstVC":
            destinationVC.myIntVariable = -17
        case "sendDataToFirstVC":
            destinationVC.myIntVariable = -1717
        default:
            break
        }
    }

    @IBAction func sendDataFirstButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "sendDataToFirstVC", sender: nil)
    }

    @IBAction func presentFirstSegueButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "presentFirstVC", sender: nil)
    }
}
