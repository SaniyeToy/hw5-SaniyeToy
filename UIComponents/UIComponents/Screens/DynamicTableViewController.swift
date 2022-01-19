//
//  MainTableViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

class ResultVC: UIViewController {

}

class DynamicTableViewController: UIViewController {

//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        peopleNames = people.map { person in person.name }
        peopleLastNames = people.map { person in person.lastname }
        filteredPeopleNames = peopleNames

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.tableView.reloadData()
        }

        //tableView.register(MyCustomTableViewCell.self, forCellReuseIdentifier: "MyCustomTableViewCell")
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCustomTableViewCell")
//        tableView.registerCell(MyCustomTableViewCell.self)

        configureSearchController()
    }

    func configureSearchController() {
        let resultVC = ResultVC()
        resultVC.view.backgroundColor = .red
        
        let searchController = UISearchController(searchResultsController: resultVC)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        self.navigationItem.searchController = searchController

    }

    private var rowCount: Int {
        get {
            return Int.random(in: 1...5)
        }
    }

    private var people: [Person] = [Person(name: "Semih", lastname: "Unlu"),
                                    Person(name: "Emre", lastname: "Korkmaz"),
                                    Person(name: "Ahmet", lastname: "Sarsilmaz"),
                                    Person(name: "Mehmet", lastname: "Bayirdanasagikosarakinmezoglu"),
                                    Person(name: "Mustafa", lastname: "Yazar"),
                                    Person(name: "Mahmut", lastname: "Ozhan"),
                                    Person(name: "Esra", lastname: "Yalcin"),
                                    Person(name: "Ayten", lastname: "Kumandas"),
                                    Person(name: "Ceren", lastname: "Demir"),
                                    Person(name: "Ayse", lastname: "Celik"),
                                    Person(name: "Fatma", lastname: "Cetin")]

    private var peopleNames: [String] = []
    private var filteredPeopleNames: [String] = []
    private var peopleLastNames: [String] = []

    func search(with searchText: String) {
        if searchText.isEmpty {
            filteredPeopleNames = peopleNames
        } else {
            filteredPeopleNames = peopleNames.filter { (personName) in
                return personName.range(of: searchText,
                                        options: .caseInsensitive,
                                        range: nil,
                                        locale: nil) != nil
            }
        }
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension DynamicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("currentIndex: ", indexPath.row)
//
//        let cell = tableView.cellForRow(at: indexPath)
//        print("cell backgroundColor: ", cell?.backgroundColor?.description)
        switch indexPath.section {
        case 0:
            print(filteredPeopleNames[indexPath.row])
        case 1:
            print(people[indexPath.row].lastname)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(Int.random(in: 50...150)) //UITableView.automaticDimension
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(150)
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 100
        default:
            return 0
        }
    }
}

// MARK: - UITableViewDataSource
extension DynamicTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rowCount
        switch section {
        case 0:
            return filteredPeopleNames.count
        case 1:
            return peopleLastNames.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCellIdentifier", for: indexPath)
//        cell.textLabel?.text = String(indexPath.row)
//        cell.backgroundColor = UIColor.random
//        return cell

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCellIdentifier", for: indexPath)
            cell.textLabel?.text = filteredPeopleNames[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomTableViewCell", for: indexPath) as! MyCustomTableViewCell
            cell.populate(with: people[indexPath.row])
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "MenuItemCellIdentifier", for: indexPath)
        }
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Name"
//        case 1:
//            return "Lastname"
//        default:
//            return ""
//        }
//    }
//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .red

        let label = UILabel(frame: CGRect(x: 16, y: 0, width: screenWidth - 32, height: 32))
        label.backgroundColor = .yellow
        switch section {
        case 0:
            label.text = "Name"
        case 1:
            label.text = "Lastname"
        default:
            break
        }
        view.addSubview(label)
        return view
    }
}

//extension DynamicTableViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        search(with: searchText)
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//    }
//}

extension DynamicTableViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
        guard let searchText = searchController.searchBar.text else { return }
        search(with: searchText)
    }
}
