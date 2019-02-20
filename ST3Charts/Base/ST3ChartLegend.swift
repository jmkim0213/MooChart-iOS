//
//  ST3ChartLegendData.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 19/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

struct ST3ChartLegend: Hashable {
    var text        : String
    var data        : Any?
    
    init(text: String, data: Any? = nil) {
        self.text = text
        self.data = data
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
        hasher.combine("\(String(describing: self.data))")
    }
    
    static func == (lhs: ST3ChartLegend, rhs: ST3ChartLegend) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
