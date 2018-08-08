//
//  HomeSteps.swift
//  SimpleNoteTakingAppTests
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

@testable import SimpleNoteTakingApp
import RealmSwift
import Nimble

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

    func fillInNoteBody(_ body: String) {
        fillIn("Note - Body", withText: body)
    }

    func fillInNoteTitle(_ title: String) {
        fillIn("Note - Title", withText: title)
    }

    func expectNumberOfNotesInListToEqual(_ count: Int) {
        let noteTableView = tester().waitForView(withAccessibilityLabel: "Note - TableView") as! UITableView
        expect(noteTableView.numberOfRows(inSection: 0)) == count
    }

    func expectToSeeNoteWithTitle(_ title: String, body: String, atRow row: NSInteger) {
        let noteCell = tester().waitForCell(at: IndexPath(row: row, section: 0), inTableViewWithAccessibilityIdentifier: "Note - TableView")
        expect(noteCell?.textLabel?.text) == title
        expect(noteCell?.detailTextLabel?.text) == body
    }

    func expectTheCreateButtonToBeEnabled() {
        let createButton = tester().waitForView(withAccessibilityLabel: "Create") as! UIButton // 無法轉型 先跳過
        expect(createButton.isEnabled) == true
    }

    func expectTheCreateButtonToBeDisabled() {
        let createButton = tester().waitForView(withAccessibilityLabel: "Create") as! UIButton // 無法轉型 先跳過
        expect(createButton.isEnabled) == false
    }
}
