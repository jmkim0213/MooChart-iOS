//
//  ST3Chart.swift
//  ST3Charts
//
//  Created by Kim JungMoo on 18/02/2019.
//  Copyright © 2019 Kim JungMoo. All rights reserved.
//

import UIKit

final class ST3ChartView: UIView {
    var legends                 : [ST3ChartLegend]          = []
    
    var barData                 : ST3ChartBarData?
    var lineData                : ST3ChartLineData?
    
    var legendFont              : UIFont                    = UIFont.systemFont(ofSize: 9)
    var legendColor             : UIColor                   = UIColor.black
    var legendDividerColor      : UIColor                   = UIColor.lightGray
    var legendBackgroundColor   : UIColor                   = UIColor.white
    var legendTopMargin         : CGFloat                   = 3
    var legendHeight            : CGFloat                   = 25
    var legendInterval          : Int                       = 3

    var highlightIndicatorColor : UIColor                   = UIColor.gray
    
    var leftAxisFont            : UIFont                    = UIFont.systemFont(ofSize: 8)
    var leftAxisColor           : UIColor                   = UIColor.black
    var leftAxisInterval        : Int                       = 2

    var leftMargin              : CGFloat                   = 15
    var rightMargin             : CGFloat                   = 30
    var horizontalIndicatorColor: UIColor                   = UIColor.gray
    
    var selectedLegend          : ST3ChartLegend?

    var chartArea: CGRect {
        let width = self.bounds.width - (self.leftMargin + self.rightMargin)
        let height = self.bounds.height - self.legendHeight
        return CGRect(x: self.leftMargin, y: 0, width: width, height: height)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.handleTouches(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.handleTouches(touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.handleTouches(touches)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.handleTouches(touches)
    }
    
    override func draw(_ rect: CGRect) {
        self.drawLeftAxis(rect)
        self.drawHighlightIndicator(rect)
        self.drawLegend(rect)
        self.drawLegendDivider(rect)
        self.drawChartBar(rect)
        self.drawChartLine(rect)
    }
    
    func reloadData() {
        self.setNeedsDisplay()
    }
    
    private func handleTouches(_ touches: Set<UITouch>) {
        let findLegned = self.findLegendByTouch(touches.first)
        if self.selectedLegend != findLegned {
            self.selectedLegend = findLegned
            self.setNeedsDisplay()
        }
    }
    
    private func findLegendByTouch(_ touch: UITouch?) -> ST3ChartLegend? {
        guard let location = touch?.location(in: self) else { return nil }
        let chartWidth = self.chartArea.width
        let groupCount = self.legends.count
        let groupWidth = chartWidth / CGFloat(groupCount)
        
        let findIndex = min(Int((location.x - self.leftMargin) / groupWidth), groupCount - 1)
        return self.legends[findIndex]
    }
    

    private func drawHighlightIndicator(_ rect: CGRect) {
        guard let selectedLegend = self.selectedLegend else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let selectedIndex = self.legends.firstIndex(of: selectedLegend) else { return }
        
        context.saveGState()
        defer { context.restoreGState() }
        
        let chartX = self.chartArea.origin.x
        let chartY = self.chartArea.origin.y
        let chartWidth = self.chartArea.width
        let viewHeight = rect.height
        
        let groupCount = self.legends.count
        let groupWidth = chartWidth / CGFloat(groupCount)
        
        let x = ((CGFloat(selectedIndex) * groupWidth) + groupWidth / 2) + chartX
        let y = chartY
        context.setFillColor(self.highlightIndicatorColor.cgColor)
        context.fill(CGRect(x: x, y: y, width: 0.5, height: viewHeight))
    }
    
    private func drawLeftAxis(_ rect: CGRect) {
        guard let barData = self.barData else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        defer { context.restoreGState() }
        
        let chartX = self.chartArea.origin.x
        let chartWidth = self.chartArea.width
        let chartHeight = self.chartArea.height
        
        let maxValue = Int(barData.maxValue)
        let attributes = self.textAttributes(font: self.leftAxisFont, color: self.leftAxisColor)
        
        
        for index in 0..<maxValue {
            guard index > 0 else { continue }
            guard index % self.leftAxisInterval == 0 else { continue }
            let text = ("\(index)" as NSString)
            
            let textSize = self.textSize(text, attributes: attributes)
            let textHeight = chartHeight / CGFloat(maxValue)
            
            let indicatorY = chartHeight - (textHeight * CGFloat(index))
            let x = chartX - textSize.width
            let y = indicatorY - (textSize.height / 2)
            
            context.setFillColor(self.horizontalIndicatorColor.cgColor)
            context.fill(CGRect(x: chartX, y: indicatorY, width: chartWidth, height: 1))
            text.draw(at: CGPoint(x: x, y: y), withAttributes: attributes)
        }
    }
    
    private func drawChartBar(_ rect: CGRect) {
        guard let barData = self.barData else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.saveGState()
        defer { context.restoreGState() }
        
        let chartX = self.chartArea.origin.x
        let chartWidth = self.chartArea.width
        let chartHeight = self.chartArea.height
        
        let groupCount = self.legends.count
        let groupWidth = chartWidth / CGFloat(groupCount)
        let totalBarWidth = groupWidth * (1 - barData.groupSpace)
        
        for (dataSetIndex, dataSet) in barData.dataSets.enumerated() {
            let barWidth = totalBarWidth / CGFloat(barData.dataSets.count)
            for (entryIndex, entry) in dataSet.entries.enumerated() {
                let x = (CGFloat(entryIndex) * groupWidth) + (CGFloat(dataSetIndex) * barWidth) + (totalBarWidth / 2) + chartX
                let y = chartHeight
                let barHeight = entry.value * (chartHeight / barData.maxValue)
                context.setFillColor(dataSet.color.cgColor)
                context.fill(CGRect(x: x, y: y, width: barWidth, height: -barHeight))
            }
        }
    }
    
    private func drawChartLine(_ rect: CGRect) {
        guard let lineData = self.lineData else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.saveGState()
        defer { context.restoreGState() }

        let chartX = self.chartArea.origin.x
        let chartWidth = self.chartArea.width
        let chartHeight = self.chartArea.height
        
        let groupCount = self.legends.count
        let groupWidth = chartWidth / CGFloat(groupCount)
        
        
        for dataSet in lineData.dataSets {
            var lineSegments = [CGPoint]()

            for (entryIndex, entry) in dataSet.entries.enumerated() {
                let x = ((CGFloat(entryIndex) * groupWidth) + groupWidth / 2) + chartX

                let y = chartHeight - (entry.value * (chartHeight / lineData.maxValue))
                
                let newPoint = CGPoint(x: x, y: y)
                lineSegments.append(newPoint)
                if (0 < entryIndex) && (entryIndex < dataSet.entries.count - 1) {
                    lineSegments.append(newPoint)
                }
            }
            context.setStrokeColor(dataSet.color.cgColor)
            context.setLineWidth(dataSet.width)
            
            context.strokeLineSegments(between: lineSegments)
        }
    }
    
    
    private func drawLegend(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        defer { context.restoreGState() }
        
        let chartX = self.chartArea.origin.x
        let chartWidth = self.chartArea.width
        let chartHeight = self.chartArea.height

        let groupCount = self.legends.count
        let groupWidth = chartWidth / CGFloat(groupCount)
        
        let attributes = self.textAttributes(font: self.legendFont, color: self.legendColor)

        for (index, legend) in self.legends.enumerated() {
            guard index > 0 else { continue }
            guard index == (groupCount - 1) || index % self.legendInterval == 0 else { continue }
            
            let text = (legend.text as NSString)
            
            let textSize = self.textSize(text, attributes: attributes)
            
            let x = (groupWidth * CGFloat(index)) + ((groupWidth - textSize.width) / 2) + chartX
            let y = chartHeight + self.legendTopMargin
            
            context.setFillColor(self.legendBackgroundColor.cgColor)
            context.fill(CGRect(x: x, y: y, width: textSize.width, height: textSize.height))
            
            text.draw(at: CGPoint(x: x, y: y), withAttributes: attributes)
        }
    }
    
    private func drawLegendDivider(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        defer { context.restoreGState() }
        
        let viewWidth = rect.width
        let chartHeight = self.chartArea.height

        let y = chartHeight
        
        context.setFillColor(self.legendDividerColor.cgColor)
        context.fill(CGRect(x: 0, y: y, width: viewWidth, height: 1))
    }
    
    private func textAttributes(font: UIFont, color: UIColor) -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color]
    }
    
    private func textSize(_ text: NSString, attributes: [NSAttributedString.Key : Any]) -> CGSize {
        return text.boundingRect(with: self.bounds.size, options: .usesFontLeading, attributes: attributes, context: nil).size
    }
}
