//
//  UITableView+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit

extension UITableView {
    func defaultCellWithReuseID(_ reuseID: String) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: reuseID) ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseID)
    }
}
