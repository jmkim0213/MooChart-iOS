//
//  ST3ChartLineData.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct ST3ChartLineData: ST3ChartData {
    var dataSets    : [ST3ChartLineDataSet]  = []
    var maxValue    : CGFloat               = 0.0
    
    init(dataSets: [ST3ChartLineDataSet]) {
        self.dataSets = dataSets
    }
}
