//
//  ViewController.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 18/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

private let kNumberOfMonth = 12

class ViewController: UIViewController {
    @IBOutlet var chartView: ST3ChartView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initChartView()
        self.initChartAxis()
        self.initChartBar()
        self.initChartLine()
        self.chartView?.reloadData()
        
    }
    
    func initChartView() {
        self.chartView?.leftMargin = 15
        self.chartView?.rightMargin = 30
        self.chartView?.bottomMargin = 25
        self.chartView?.horizontalIndicatorColor = UIColor.fromRed(237, green: 237, blue: 237, alpha: 1.0)
    }
    
    func initChartAxis() {
        // 범례 설정
        var axises = [ST3ChartAxis]()
        for i in 0..<kNumberOfMonth {
            let text = String(format: "2019.%02d", i + 1)
            axises.append(ST3ChartAxis(text: text))
        }
        
        self.chartView?.highlightIndicatorColor = UIColor.fromRed(136, green: 136, blue: 136, alpha: 1.0)
        self.chartView?.axises = axises
        self.chartView?.axisFont = UIFont.systemFont(ofSize: 9)
        self.chartView?.axisColor = UIColor.fromRed(68, green: 68, blue: 68, alpha: 1.0)
        self.chartView?.axisDividerColor = UIColor.fromRed(221, green: 221, blue: 221, alpha: 1.0)
        self.chartView?.axisInterval = kNumberOfMonth / 4
    }
    
    func initChartBar() {
        var entries1: [ST3ChartBarDataEntry] = []
        
        for _ in 0..<kNumberOfMonth {
            let value = 40 + arc4random_uniform(60)
            let entry = ST3ChartBarDataEntry(value: CGFloat(value))
            entries1.append(entry)
        }
        
        var dataSet1 = ST3ChartBarDataSet(entries: entries1)
        dataSet1.color = UIColor.fromRed(128, green: 213, blue: 220, alpha: 1.0)
        
        var entries2: [ST3ChartBarDataEntry] = []
        for _ in 0..<kNumberOfMonth {
            let value = 40 + arc4random_uniform(60)
            let entry = ST3ChartBarDataEntry(value: CGFloat(value))
            entries2.append(entry)
        }
        
        var dataSet2 = ST3ChartBarDataSet(entries: entries2)
        dataSet2.color = UIColor.fromRed(187, green: 221, blue: 255, alpha: 1.0)
        
        var data = ST3ChartBarData(dataSets: [dataSet1, dataSet2])
        data.maxValue = 150
        data.groupSpace = 0.5
        
        self.chartView?.barData = data
        
        self.chartView?.leftAxisFont = UIFont.systemFont(ofSize: 8)
        
        self.chartView?.leftAxisColor = UIColor.fromRed(68, green: 68, blue: 68, alpha: 1.0)
        self.chartView?.leftAxisInterval = Int(data.maxValue) / 5
        
    }

    func initChartLine() {
        var entries1: [ST3ChartLineDataEntry] = []
        
        for _ in 0..<kNumberOfMonth {
            let value = 40 + arc4random_uniform(60)
            let entry = ST3ChartLineDataEntry(value: CGFloat(value))
            entries1.append(entry)
        }
        
        var dataSet1 = ST3ChartLineDataSet(entries: entries1)
        dataSet1.color = UIColor.fromRed(118, green: 214, blue: 181, alpha: 1.0)
        
        var entries2: [ST3ChartLineDataEntry] = []
        for _ in 0..<kNumberOfMonth {
            let value = 20 + arc4random_uniform(30)
            let entry = ST3ChartLineDataEntry(value: CGFloat(value))
            entries2.append(entry)
        }
        
        var dataSet2 = ST3ChartLineDataSet(entries: entries2)
        dataSet2.color = UIColor.fromRed(123, green: 181, blue: 240, alpha: 1.0)

        var data = ST3ChartLineData(dataSets: [dataSet1, dataSet2])
//        var data = ST3ChartLineData(dataSets: [dataSet1])
        data.maxValue = 150
        
        self.chartView?.lineData = data
    }
}
