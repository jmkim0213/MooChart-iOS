//
//  ST3ChartBarDataSet.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct ST3ChartLineDataSet: ST3ChartDataSet {
    var entries             : [ST3ChartLineDataEntry]   = []
    var color               : UIColor                   = .blue
    var width               : CGFloat                   = 1.0
    
    var circleRadius        : CGFloat                   = 5
    var holeRadius          : CGFloat                   = 1
    var circleBorder        : CGFloat                   = 1

    var circleColor         : UIColor                   = .white
    var holeColor           : UIColor                   = .blue
    var circleBorderColor   : UIColor                   = .white

    init(entries: [ST3ChartLineDataEntry]) {
        self.entries = entries
    }
}
