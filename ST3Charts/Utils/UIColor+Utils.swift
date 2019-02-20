//
//  UIColor+Utils.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

extension UIColor {
    static func fromRed(_ red:Int, green:Int, blue:Int, alpha:CGFloat) -> UIColor {
        let r = CGFloat(red) / 255.0
        let g = CGFloat(green) / 255.0
        let b = CGFloat(blue) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
