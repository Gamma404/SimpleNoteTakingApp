//
//  Note.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import RealmSwift

class Note: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
}
