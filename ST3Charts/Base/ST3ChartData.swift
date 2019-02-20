//
//  ST3ChartBarData.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 19/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

protocol ST3ChartData {
    associatedtype DataSet: ST3ChartDataSet
    var dataSets    : [DataSet]     { get set }
    var maxValue    : CGFloat       { get set }
}
