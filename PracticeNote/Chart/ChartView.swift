//
//  ChartView.swift
//  PracticeNote
//
//  Created by 배진우 on 2022/12/18.
//

import SwiftUI
import Charts

struct Data: Identifiable {
    var id = UUID()
    var date: String
    var endDate: String
    var value: Int
}

struct ChartView: View {
    var datas = [
        Data(date: "2022-12-18", endDate: "2022-12-20", value: 5),
        Data(date: "2022-12-19", endDate: "2022-12-20",  value: 8),
        Data(date: "2022-12-20", endDate: "2022-12-23",  value: 2),
        Data(date: "2022-12-21", endDate: "2022-12-21",  value: 1),
        Data(date: "2022-12-22", endDate: "2022-12-23",  value: 10),
        Data(date: "2022-12-23", endDate: "2022-12-25",  value: 6),
    ]
    
    var body: some View {
        BarChartView(datas: datas)
        PointChartView(datas: datas)
        AreaChartView(datas: datas)
        RectangleChartView(datas: datas)
        LineChartView(datas: datas)
        RuleChartView1(datas: datas)
        RuleChartView2(datas: datas)
        CombineChartView(datas: datas)
    }
}

struct BarChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                BarMark(x: .value("Date", data.date),
                        y: .value("Value", data.value))
            }
        }
    }
}

struct PointChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                PointMark(x: .value("Date", data.date),
                          y: .value("Value", data.value))
            }
        }
    }
}

struct AreaChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                AreaMark(x: .value("Date", data.date),
                         y: .value("Value", data.value))
            }
        }
    }
}

struct RectangleChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                RectangleMark(x: .value("Date", data.date),
                              y: .value("Value", data.value))
            }
        }
    }
}

struct LineChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                LineMark(x: .value("Date", data.date),
                              y: .value("Value", data.value))
            }
        }
    }
}

struct RuleChartView1: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                BarMark(x: .value("Date", data.date),
                        y: .value("Value", data.value))
            }
            
            RuleMark(y: .value("Value", 8))
                .foregroundStyle(.red)
        }
    }
}

struct RuleChartView2: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                RuleMark(xStart: .value("Date", data.date),
                         xEnd: .value("EndDate", data.endDate),
                         y: .value("Value", data.value))
            }
        }
    }
}

struct CombineChartView: View {
    var datas: [Data]
    
    var body: some View {
        Chart {
            ForEach(datas) { data in
                BarMark(x: .value("Date", data.date),
                        y: .value("Value", data.value))
            }
            
            ForEach(datas) { data in
                LineMark(x: .value("Date", data.date),
                        y: .value("Value", data.value / 2))
                .foregroundStyle(.yellow)
            }
            
            RuleMark(y: .value("Value", 8))
                .foregroundStyle(.red)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
