//
//  Alert.swift
//  DrawRouteProject
//
//  Created by MacOS on 20.01.2022.
//

import Foundation
import UIKit
extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        settingsAction.setValue(UIColor.systemMint, forKey: "titleTextColor")
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        //Alert message font and color settings
        let messageAttributed = NSMutableAttributedString(
            string: alertController.message!,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                         NSAttributedString.Key.foregroundColor: UIColor.white,
                        ])
        alertController.setValue(messageAttributed, forKey: "attributedMessage")
        
        
        //Alert View settings
        let subview = alertController.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first!.subviews.first! as UIView
        alertContentView.backgroundColor = .darkGray
        alertContentView.layer.cornerRadius = 0
        alertContentView.layer.masksToBounds = false
        alertController.view.backgroundColor = .darkGray
        
    }
}

