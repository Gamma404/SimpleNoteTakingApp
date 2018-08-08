//
//  NoteViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit
import RealmSwift

fileprivate func <<T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func ><T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}


class NoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!

    var note: Note? {
        didSet {
            guard titleTextField != nil && bodyTextView != nil else {
                return
            }
            titleTextField.text = note?.title
            bodyTextView.text = note?.body
            navigationItem.rightBarButtonItem?.title = note != nil ? "Update" : "Create"

            //增加一個對textFields的監聽
            NotificationCenter.default.addObserver(self, selector:
            #selector(self.greetingTextFieldChanged), name:
            NSNotification.Name(rawValue:
            "UITextFieldTextDidChangeNotification"),
                    object: self.titleTextField)
        }

    }

    //textfields有修改時，根據有沒有資料決定create的btn是否enable
    @objc func greetingTextFieldChanged(obj: Notification) {
        print("greetingTextFieldChanged")
        print("\(String(describing: titleTextField.text?.count))")

        let textField: UITextField = obj.object as! UITextField
        guard let _: UITextRange = textField.markedTextRange else {
            if (textField.text! as NSString).length > 0 {
                navigationItem.rightBarButtonItem?.isEnabled = true
            } else {
                navigationItem.rightBarButtonItem?.isEnabled = false
            }
            return
        }
    }

    //銷毀時要把監聽給註銷
    deinit {
        NotificationCenter.default.removeObserver(self, name:
        NSNotification.Name(rawValue:
        "UITextFieldTextDidChangeNotification"), object: self.titleTextField)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationButtons()
        setupBodyTextView()
    }

    @objc func onTapCreateButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
        saveNoteToDatabase()
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNewNoteCreated), object: nil)
    }

    @objc func onTapCancelButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NoteViewController {

    //用程式產生BarButtonItem兩個按鍵
    fileprivate func setupNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(NoteViewController.onTapCreateButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(NoteViewController.onTapCancelButton))

        navigationItem.rightBarButtonItem?.isEnabled = false
    }

    fileprivate func setupBodyTextView() {
        bodyTextView.layer.borderWidth = 0.5
        bodyTextView.layer.borderColor = UIColor.colorWithRed(red: 204, green: 204, blue: 204).cgColor
        bodyTextView.layer.cornerRadius = 4;
    }

    //將輸入的資料存到Realm
    fileprivate func saveNoteToDatabase() {
        let realm = try! Realm()
        try! realm.write {
            let note = self.note ?? Note()
            note.title = titleTextField.text!
            note.body = bodyTextView.text!
            realm.add(note)
            print("fileURL: \(realm.configuration.fileURL!)")
        }
    }
}

