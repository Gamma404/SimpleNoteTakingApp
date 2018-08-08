//
//  UIColor+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithRed(red: NSInteger, green: NSInteger, blue: NSInteger) -> UIColor {
        let max: CGFloat = 255.0
        return UIColor(red: CGFloat(red) / max, green: CGFloat(green) / max, blue: CGFloat(blue) / max, alpha: 1)
    }
}
