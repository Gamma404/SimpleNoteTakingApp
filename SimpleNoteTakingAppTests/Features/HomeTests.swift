//
//  HomeTests.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import KIF
import RealmSwift
import UIKit
import Nimble

class HomeTests: BaseUITests {

    override func beforeAll() {
        useTestDatabase()
    }

    override func beforeEach() {
        backToRoot()
        haveNoNotes()
    }

    /*
    情境: 如果沒有筆記, label需要顯示"No notes”字串
    設定這裡沒有任何筆記
    當我前往首頁時
    將會看到一個label顯示"No notes"字串
    因此，預期不會看到note列表
    */
    func testNoNotes() {
        haveNoNotes()
        visitHomeScreen()
        expectToSeeLabel("No notes")
        expectNotToSeeNoteList()
    }

    /*
    情境: 創建新筆記
    設定這裡沒有任何筆記
    當我前往首頁
    並且點擊“增加筆記”按鈕
    預期這個新增按鈕被設置為不可點擊
    把筆記的title填入”new note”
    之後預期新增按鈕會變為可以點擊狀態
    將筆記的body填入"new body"
    點擊“建立”按鈕
    預期會看到一個筆記位於第0列，title為”new note”且body為”new body"
    我預期在列表中，筆記的數量為1
    */
    func testCreateNewNote() {
        haveNoNotes()
        visitHomeScreen()
        tapButton(buttonName: "Add note")
        //expectTheCreateButtonToBeDisabled() // 無法轉型 先跳過
        fillInNoteTitle("new note")
        //expectTheCreateButtonToBeEnabled()  // 無法轉型 先跳過
        fillInNoteBody("new body")
        tapButton(buttonName: "Create")
        expectToSeeNoteWithTitle("new note", body: "new body", atRow: 0)
        expectNumberOfNotesInListToEqual(1)
    }
}
