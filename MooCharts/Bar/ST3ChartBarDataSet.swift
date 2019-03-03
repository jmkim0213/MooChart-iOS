//
//  MooChartBarDataSet.swift
//  MooCharts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct MooChartBarDataSet: MooChartDataSet {
    var entries : [MooChartBarDataEntry]    = []
    var color   : UIColor                   = .blue
    
    init(entries: [MooChartBarDataEntry]) {
        self.entries = entries
    }
}
