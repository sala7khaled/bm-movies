//
//  AlertController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class AlertController: UIViewController {
    
    static let shared = AlertController()
    var alert: UIAlertController = UIAlertController()
    
    func show(in vc: UIViewController?,
              title: String? = nil,
              message: String? = nil,
              btnTitle: String? = nil,
              withCancel: Bool = false,
              style: UIAlertController.Style = .alert,
              handler: ((UIAlertAction) -> ())? = nil
    ) {
        alert = UIAlertController(title: "", message: nil, preferredStyle: style)
        
        let titleFont = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]

        let messageFont = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
        ]

        if let title = title {
            let titleAttr = NSMutableAttributedString(string: title,
                                                      attributes: titleFont)
            alert.setValue(titleAttr, forKey: "attributedTitle")
        }

        if let message = message {
            let messageAttr = NSMutableAttributedString(string: message,
                                                      attributes: messageFont)
            alert.setValue(messageAttr, forKey: "attributedMessage")
        }
        
        vc?.addActionSheetForIpad(actionSheet: alert)
        
        alert.addAction(UIAlertAction(title: btnTitle ?? "ok".l(), style: .default, handler: handler))
        
        if (withCancel) {
            alert.addAction(UIAlertAction(title: "cancel".l(), style: .cancel))
        }
        
        vc?.present(alert, animated: true)
    }
}
