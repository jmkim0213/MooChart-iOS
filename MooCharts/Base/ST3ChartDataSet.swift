//
//  MooChartDataSet.swift
//  MooCharts
//
//  Created by Kim JungMoo on 18/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

protocol MooChartDataSet {
    associatedtype Entry: MooChartDataEntry
    var entries : [Entry]   { get set }
    var color   : UIColor   { get set }
}
