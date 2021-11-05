// UIViewControler+Extension.swift
// Copyright © Edo. All rights reserved.

import UIKit

extension UIViewController {
    func showAlert(alertText: String, alertMessage: String) {
        let alert = UIAlertController(
            title: alertText,
            message: alertMessage,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
