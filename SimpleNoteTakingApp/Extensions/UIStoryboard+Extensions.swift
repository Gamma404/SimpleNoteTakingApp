//
//  UIStoryboard+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 gamma404. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func main() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func initializeViewController<T>(_ viewController: T.Type) -> T where T: UIViewController {
        return UIStoryboard.main().instantiateViewController(withIdentifier: String(describing: viewController)) as! T
    }
}
