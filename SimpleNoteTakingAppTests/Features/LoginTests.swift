//
//  LoginTests.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import KIF

class LoginTests : KIFTestCase{
    
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
        expectToSeeAlert(text:"Password cannot be empty")
        tapButton(buttonName: "OK")
    }


}
