//
//  ST3ChartBarDataSet.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct ST3ChartBarDataSet: ST3ChartDataSet {
    var entries : [ST3ChartBarDataEntry]    = []
    var color   : UIColor                   = .blue
    
    init(entries: [ST3ChartBarDataEntry]) {
        self.entries = entries
    }
}
