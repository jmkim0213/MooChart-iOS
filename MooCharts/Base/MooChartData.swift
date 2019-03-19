//
//  MooChartBarData.swift
//  MooCharts
//
//  Created by Kim JungMoo on 19/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

protocol MooChartData {
    associatedtype DataSet: MooChartDataSet
    var dataSets    : [DataSet]     { get set }
    var maxValue    : CGFloat       { get set }
}
