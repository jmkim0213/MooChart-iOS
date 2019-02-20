//
//  ST3ChartBarData.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 20/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct ST3ChartBarData: ST3ChartData {
    var dataSets    : [ST3ChartBarDataSet]  = []
    var maxValue    : CGFloat               = 0.0
    var groupSpace  : CGFloat               = 0.5
    
    init(dataSets: [ST3ChartBarDataSet]) {
        self.dataSets = dataSets
    }
}
