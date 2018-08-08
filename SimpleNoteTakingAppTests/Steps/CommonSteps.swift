//
//  CommonSteps.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import Foundation
import RealmSwift

extension BaseUITests{
    func fillIn(_ accessibilityLabel: String, withText text: String) {
        tester().clearText(fromAndThenEnterText: text, intoViewWithAccessibilityLabel: accessibilityLabel)
    }

    func expectToSee(_ text: String) {
        tester().waitForView(withAccessibilityLabel: text)
    }

    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    func expectToSeeAlert(text: String) {
        expectToSee(text)
    }

    func fillInUsername() {
        tester().enterText("appcoda", intoViewWithAccessibilityLabel: "Login - Username")
    }

    func fillInWrongPassword() {
        tester().enterText("wrongPassword", intoViewWithAccessibilityLabel: "Login - Password")
    }

    func fillInCorrectPassword() {
        tester().enterText("password", intoViewWithAccessibilityLabel: "Login - Password")
    }

    func useTestDatabase() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "put any name here"
    }

    func backToRoot() {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            rootViewController.popToRootViewController(animated: false)
        }
    }

    func clearDatabase() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }

    func visitHomeScreen() {
        fillInUsername()
        fillInCorrectPassword()
        tapButton(buttonName: "Login")
    }
}
