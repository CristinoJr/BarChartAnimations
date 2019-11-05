//
//  ContentView.swift
//  BarChartAnimations
//
//  Created by Cristino Junior on 03/11/19.
//  Copyright © 2019 Cristino Junior. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40, 70, 100],
        [150, 100, 50, 200, 15, 80, 125],
        [20, 25, 60, 50, 110, 120, 40]
    ]
    
    var body: some View {
        ZStack {
            Color("appBackground").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Consumo calórico")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker.init(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Manhã").tag(0)
                    Text("Tarde").tag(1)
                    Text("Noite").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24 )
            
                HStack (spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0], textBarChart: "D")
                    BarView(value: dataPoints[pickerSelectedItem][1],textBarChart: "S")
                    BarView(value: dataPoints[pickerSelectedItem][2],textBarChart: "T")
                    BarView(value: dataPoints[pickerSelectedItem][3], textBarChart: "Q")
                    BarView(value: dataPoints[pickerSelectedItem][4], textBarChart: "Q")
                    BarView(value: dataPoints[pickerSelectedItem][5], textBarChart: "S")
                    BarView(value: dataPoints[pickerSelectedItem][6], textBarChart: "S")
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

struct BarView: View {
    var value: CGFloat
    var textBarChart: String
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(textBarChart).padding(.top, 8)
        }
    }
}
