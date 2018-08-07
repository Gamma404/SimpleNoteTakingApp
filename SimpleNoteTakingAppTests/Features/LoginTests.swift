//
//  LoginTests.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import KIF

class LoginTests : KIFTestCase{
    func testEmptyUsernameAndPassword() {
        clearOutUsernameAndPasswordFields()
        tapButton(buttonName: "Login")
        expectToSeeAlert(text:"Username cannot be empty")
        tapButton(buttonName: "OK")
    }
}
