//
//  UIViewController+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlertWithMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
