//
//  HomeViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit
import RealmSwift

//UI元件
class HomeViewController: UIViewController {

    @IBOutlet weak var emptyNotesLabel: UILabel!
    @IBOutlet weak var notesTableView: UITableView!

    var notes: Results<Note>?
    lazy var noteViewController: NoteViewController = {
        let viewController = UIStoryboard.initializeViewController(NoteViewController.self)
        let _ = viewController.view
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                selector: #selector(HomeViewController.onNewNoteCreated),
                name: NSNotification.Name(rawValue: notificationNewNoteCreated), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTapAddNoteButton(_ sender: Any) {
        noteViewController.note = nil
        navigationController?.pushViewController(noteViewController, animated: true)
    }

    @objc func onNewNoteCreated() {
        updateTableViewVisibility()
        notesTableView.reloadData()
    }
}

//Realm
extension HomeViewController {
    func updateNotes() {
        let realm = try! Realm()
        notes = realm.objects(Note.self)
        updateTableViewVisibility()
        notesTableView.reloadData()
    }

    func updateTableViewVisibility() {
        emptyNotesLabel.isHidden = (notes?.count)! > 0
        notesTableView.isHidden = !emptyNotesLabel.isHidden
    }
}

//DataSource Dalegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.defaultCellWithReuseID("reuseID")
        let note = notes![indexPath.row]
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.body
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        noteViewController.note = notes![indexPath.row]
        navigationController?.pushViewController(noteViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(notes![indexPath.row])
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            tableView.endUpdates()
            updateTableViewVisibility()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
