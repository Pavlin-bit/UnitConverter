//
//  ContentView.swift
//  UnitConverter
//
//  Created by Pavlin Hristov on 21.01.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 1
    let inputUnits = ["Meters", "Kilometers", "Yards", "Feet", "Miles"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["Meters", "Kilometers", "Yards", "Feet", "Miles"]
    
    var UnitAfterConvert: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case "Meters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case "Kilometers":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case "Yards":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.yards)
        case "Feet":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case "Miles":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        switch outputUnits[outputUnitValue] {
        case "Meters":
            output = String(describing: input.converted(to: UnitLength.meters))
        case "Kilometers":
            output = String(describing: input.converted(to: UnitLength.kilometers))
        case "Yards":
            output = String(describing: input.converted(to: UnitLength.yards))
        case "Feet":
            output = String(describing: input.converted(to: UnitLength.feet))
        case "Miles":
            output = String(describing: input.converted(to: UnitLength.miles))
        default:
            output = String(describing: input.converted(to: UnitLength.meters))
        }
        return output
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Input Value")){
                    TextField("", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Choose Input Value")){
                    Picker("", selection: $inputUnitValue) {
                        ForEach(0 ..< inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Choose Output Value")){
                    Picker("", selection: $outputUnitValue) {
                        ForEach(0 ..< outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Value")){
                    
                    Text("\(UnitAfterConvert)")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
