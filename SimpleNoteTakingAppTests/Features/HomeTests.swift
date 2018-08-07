//
//  HomeTests.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import KIF
import Realm
import RealmSwift
import UIKit

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
    
}