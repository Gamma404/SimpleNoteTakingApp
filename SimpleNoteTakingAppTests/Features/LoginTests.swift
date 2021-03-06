//
//  LoginTests.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import KIF

class LoginTests : BaseUITests{

    //每個test跑之前
    override func beforeEach() {
        clearOutUsernameAndPasswordFields()
    }

    /*情境:
     使用者名稱以及密碼為空白
     給定已經清空的使用者名稱以及密碼欄位
     當我點擊“登入”按鈕
     預期會看到提示訊息 “使用者欄位不得為空白”*/
    func testEmptyUsernameAndPassword() {
        tapButton(buttonName: "Login")
        expectToSeeAlert(text:"Username cannot be empty")
        tapButton(buttonName: "OK")
    }
    
    /*
     情境: 密碼欄位空白
     先將使用者名稱與密碼欄位清空
     當我填入使用者名稱後
     點擊"登入"按鈕
     然後，預期將出現提示訊息”密碼欄位不得空白”
     */
    func testEmptyPassword() {
        fillInUsername()
        tapButton(buttonName: "Login")
        expectToSeeAlert(text: "Password cannot be empty")
        tapButton(buttonName: "OK")
    }

    /*
      情境: 錯誤的使用者名稱或是密碼
      先將使用者名稱與密碼欄位清空
      填入使用者名稱
      並且填入一組錯誤的密碼
      點擊”登入” 按鈕
      然後，預期將出現提示訊息”使用者名稱或密碼欄位輸入錯誤”
    */
    func testWrongUsernameOrPassword() {
        fillInUsername()
        fillInWrongPassword()
        tapButton(buttonName: "Login")
        expectToSeeAlert(text: "Username or password is incorrect")
        tapButton(buttonName: "OK")
    }

    /*
      情境: 輸入正確的使用者名稱與密碼
      先將使用者名稱與密碼欄位清空
      當我填入一組使用者名稱
      並且填入正確的密碼
      接者點擊”登入”按鈕
      預期將進入到首頁
    */
    func testCorrectUsernameAndPassword() {
        fillInUsername()
        fillInCorrectPassword()
        tapButton(buttonName: "Login")
        expectToGoToHomeScreen()
    }

}
