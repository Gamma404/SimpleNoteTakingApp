//
//  LoginViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var homeViewController : HomeViewController = {
        let viewController = UIStoryboard.initializeViewController(HomeViewController.self)
        return viewController
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func onTapLoginButton(_ sender: UIButton) {
        guard let username = usernameTextField.text , username.count > 0 else {
            showErrorAlertWithMessage("Username cannot be empty")
            return
        }
        
        guard let password = passwordTextField.text , password.count > 0 else {
            showErrorAlertWithMessage("Password cannot be empty")
            return
        }
        guard username == correctUsername && password == correctPassword else {
            showErrorAlertWithMessage("Username or password is incorrect")
            return
        }

    }
}
