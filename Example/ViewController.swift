//
//  ViewController.swift
//  MooCharts
//
//  Created by Kim JungMoo on 18/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

private let kNumberOfMonth = 12

class ViewController: UIViewController {
    @IBOutlet var chartView     : MooChartView?
    @IBOutlet var selectLabel   : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initChartView()
        self.initChartAxis()
        self.initChartBar()
        self.initChartLine()
        self.chartView?.reloadData()
    }
    
    func initChartView() {
        self.chartView?.delegate = self
        self.chartView?.leftMargin = 35
        self.chartView?.rightMargin = 20
        self.chartView?.bottomMargin = 25
        self.chartView?.axisMargin = 2
        self.chartView?.lineAxisMargin = 3
        self.chartView?.rightAxisMargin = 3
        
        self.chartView?.highlightIndicatorColor = UIColor.fromRed(136, green: 136, blue: 136)
    }
    
    func initChartAxis() {
        var axises = [MooChartAxis]()
        for i in 0..<kNumberOfMonth {
            let text = String(format: "2019.%02d", i + 1)
            axises.append(MooChartAxis(text: text, data: text))
        }
        
        self.chartView?.axises = axises
        self.chartView?.axisFont = UIFont.systemFont(ofSize: 10)
        self.chartView?.axisColor = UIColor.fromRed(68, green: 68, blue: 68)
        self.chartView?.axisDividerColor = UIColor.fromRed(211, green: 211, blue: 211)
        self.chartView?.axisInterval = kNumberOfMonth / 4
    }
    
    func initChartBar() {
        var entries1: [MooChartBarDataEntry] = []
        
        for _ in 0..<kNumberOfMonth {
            let value = 40 + arc4random_uniform(60)
            let entry = MooChartBarDataEntry(value: CGFloat(value))
            entries1.append(entry)
        }
        
        var dataSet1 = MooChartBarDataSet(entries: entries1)
        dataSet1.color = UIColor.fromRed(135, green: 232, blue: 198)
        
        var entries2: [MooChartBarDataEntry] = []
        for _ in 0..<kNumberOfMonth {
            let value = 40 + arc4random_uniform(60)
            let entry = MooChartBarDataEntry(value: CGFloat(value))
            entries2.append(entry)
        }
        
        var dataSet2 = MooChartBarDataSet(entries: entries2)
        dataSet2.color = UIColor.fromRed(122, green: 202, blue: 255)
        
        var data = MooChartBarData(dataSets: [dataSet1, dataSet2])
        data.maxValue = 150
        data.groupSpace = 0.5
        
        self.chartView?.barData = data
    }

    func initChartLine() {
        var entries1: [MooChartLineDataEntry] = []
        
        for _ in 0..<kNumberOfMonth {
            let value = 5000 + arc4random_uniform(5000)
            let entry = MooChartLineDataEntry(value: CGFloat(value))
            entries1.append(entry)
        }
        
        var dataSet1 = MooChartLineDataSet(entries: entries1)
        dataSet1.color = UIColor.fromRed(128, green: 220, blue: 188)
        dataSet1.circleColor = UIColor.fromRed(128, green: 220, blue: 188)
        dataSet1.holeColor = UIColor.white
        dataSet1.circleBorderColor = UIColor.white
        dataSet1.circleRadius = 4
        dataSet1.holeRadius = 1
        dataSet1.circleBorder = 1
        dataSet1.width = 1
        
        var entries2: [MooChartLineDataEntry] = []
        for _ in 0..<kNumberOfMonth {
            let value = 8000 + arc4random_uniform(5000)
            let entry = MooChartLineDataEntry(value: CGFloat(value))
            entries2.append(entry)
        }
        
        var dataSet2 = MooChartLineDataSet(entries: entries2)
        dataSet2.color = UIColor.fromRed(108, green: 170, blue: 231)
        dataSet2.circleColor = UIColor.fromRed(108, green: 170, blue: 231)
        dataSet2.holeColor = UIColor.white
        dataSet2.circleBorderColor = UIColor.white
        dataSet2.circleRadius = 4
        dataSet2.holeRadius = 1
        dataSet2.circleBorder = 1
        dataSet2.width = 1
        dataSet2.dashSpace = 3
        dataSet2.dashWidth = 3
        
        var data = MooChartLineData(dataSets: [dataSet1, dataSet2])
        data.maxValue = 20000
        
        self.chartView?.lineData = data
        self.chartView?.lineAxisFont = UIFont.systemFont(ofSize: 10)
        self.chartView?.lineAxisColor = UIColor.fromRed(68, green: 68, blue: 68)
        self.chartView?.lineAxisInterval = Int(data.maxValue) / 5
    }
}

extension ViewController: MooChartViewDelegate {
    func chartView(_ chartView: MooChartView, lineAxisTextFor value: CGFloat, withIndex index: Int) -> String {
        return String(format: "%.1f억", (value / 10000))
    }
    
    func chartView(_ chartView: MooChartView, rightAxisTextFor value: CGFloat, withIndex index: Int) -> String {
        return (index == 0) ? "건" : ""
    }
    
    func chartView(_ chartView: MooChartView, lineAxisTextFor value: CGFloat) -> String {
        return String(format: "%.1f억", (value / 10000))
    }
    
    func chartView(_ chartView: MooChartView, axisTextFor axis: MooChartAxis) -> String {
        return axis.text
    }
    
    func chartView(_ chartView: MooChartView, didSelected axis: MooChartAxis?) {
        guard let data = axis?.data as? String else { return }
        self.selectLabel?.text = "select: \(data)"
    }
    
    func chartView(_ chartView: MooChartView, indicatorColorFor index: Int) -> UIColor? {
        return (index == 0) ? UIColor.fromRed(211, green: 211, blue: 211) : UIColor.fromRed(237, green: 237, blue: 237)
    }
}
