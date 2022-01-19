//
//  UITableViewExtensions.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 8.01.2022.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
//        let nib = UINib(nibName: cell.self.description(), bundle: nil)
//        register(nib, forCellReuseIdentifier: cell.self.description())
    }
}
