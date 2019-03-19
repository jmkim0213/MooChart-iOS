//
//  MooChartBarData.swift
//  MooCharts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct MooChartBarData: MooChartData {
    var dataSets    : [MooChartBarDataSet]  = []
    var maxValue    : CGFloat               = 0.0
    var groupSpace  : CGFloat               = 0.5
    
    init(dataSets: [MooChartBarDataSet]) {
        self.dataSets = dataSets
    }
}
