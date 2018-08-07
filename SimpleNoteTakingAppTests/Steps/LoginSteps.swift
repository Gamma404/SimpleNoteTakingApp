//
//  LoginSteps.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import Foundation

extension LoginTests {
    func clearOutUsernameAndPasswordFields() {
        tester().clearTextFromView(withAccessibilityLabel: "Login - Username")
        tester().clearTextFromView(withAccessibilityLabel: "Login - Password")
    }

    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }

    func expectToSeeAlert(text: String) {
        tester().waitForView(withAccessibilityLabel: (text))
    }

    func fillInUsername() {
        tester().enterText("appcoda", intoViewWithAccessibilityLabel: "Login - Username")
    }
}
