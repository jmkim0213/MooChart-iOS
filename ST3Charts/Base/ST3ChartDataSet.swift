//
//  ST3ChartDataSet.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 18/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

protocol ST3ChartDataSet {
    associatedtype Entry: ST3ChartDataEntry
    var entries : [Entry]   { get set }
    var color   : UIColor   { get set }
}
