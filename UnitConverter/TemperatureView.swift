//
//  TemperatureView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 13/03/23.
//

import SwiftUI

struct TemperatureView: View {
    @Binding var value: Double
    var result: Double {
        var unitType: UnitTemperature
        switch temperatureValueSelection {
        case "Celsius":
            unitType = .celsius
        case "Fahrenheit":
            unitType = .fahrenheit
        case "Kelvin":
            unitType = .kelvin
        default:
            unitType = .celsius
        }
        let firstValue = Measurement(value: value, unit: unitType)
        switch temperatureResultSelection {
        case "Celsius":
            return firstValue.converted(to: UnitTemperature.celsius).value
        case "Fahrenheit":
            return firstValue.converted(to: UnitTemperature.fahrenheit).value
        case "Kelvin":
            return firstValue.converted(to: UnitTemperature.kelvin).value
        default:
            return firstValue.converted(to: UnitTemperature.celsius).value
        }
    }
    
    let temperatureUnitType = ["Celsius", "Fahrenheit", "Kelvin"]
    @State var temperatureValueSelection = "Celsius"
    @State var temperatureResultSelection = "Celsius"
    
    var body: some View {
        Section {
            HStack {
                ValueView(value: $value)
                Picker("", selection: $temperatureValueSelection) {
                    ForEach(temperatureUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Value")
        }
        
        Section {
            HStack {
                Text(String(result.formatted()))
                Picker("", selection: $temperatureResultSelection) {
                    ForEach(temperatureUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Result")
        }
    }
}
