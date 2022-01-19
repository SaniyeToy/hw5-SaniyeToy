//
//  UIColorExtensions.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
}
