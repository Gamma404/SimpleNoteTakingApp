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

    func expectToGoToHomeScreen() {
        //預期登入畫面中的UI元件消失。
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login - Username")
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login - Password")
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login")

        //並預期看到首頁上的相關UI元件
        tester().waitForView(withAccessibilityLabel: "No notes")
        tester().waitForView(withAccessibilityLabel: "Add note")
    }
}
