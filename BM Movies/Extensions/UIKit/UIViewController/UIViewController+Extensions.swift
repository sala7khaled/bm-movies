//
//  UIViewController+Extensions.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    func showAlert(title: String, message: String) {
        AlertController.shared.show(in: self, title: title, message: message)
        
    }
    
    func showError(message: String?) {
        AlertController.shared.show(in: self, message: message ?? "something_went_worng".l())
        
    }
    
    public func addActionSheetForIpad(actionSheet: UIAlertController) {
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }

}
