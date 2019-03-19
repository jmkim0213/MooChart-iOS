//
//  MooChartLineData.swift
//  MooCharts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct MooChartLineData: MooChartData {
    var dataSets    : [MooChartLineDataSet]     = []
    var maxValue    : CGFloat                   = 0.0
    
    init(dataSets: [MooChartLineDataSet]) {
        self.dataSets = dataSets
    }
}

