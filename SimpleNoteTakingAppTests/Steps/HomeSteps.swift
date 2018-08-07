//
//  HomeSteps.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import Foundation

extension HomeTests{

    func expectNotToSeeNoteList() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Note - Table View")
    }

    func expectToSeeLabel(_ text: String) {
        expectToSee(text)
    }

    //從資料庫把全部紀錄刪除
    func haveNoNotes() {
        clearDatabase()
    }
}
