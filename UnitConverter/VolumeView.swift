//
//  VolumeView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 14/03/23.
//

import SwiftUI

struct VolumeView: View {
    @Binding var value: Double
    var result: Double {
        let firstValue: Measurement<UnitVolume>
        switch volumeValueSelection {
        case "Milliliters":
            firstValue = Measurement(value: value, unit: .milliliters)
        case "Liters":
            firstValue = Measurement(value: value, unit: .liters)
        case "Cups":
            firstValue = Measurement(value: value, unit: .cups)
        case "Pints":
            firstValue = Measurement(value: value, unit: .pints)
        case "Gallons":
            firstValue = Measurement(value: value, unit: .gallons)
        default:
            firstValue = Measurement(value: value, unit: .liters)
        }
        switch volumeResultSelection {
        case "Milliliters":
            return firstValue.converted(to: .milliliters).value
        case "Liters":
            return firstValue.converted(to: .liters).value
        case "Cups":
            return firstValue.converted(to: .cups).value
        case "Pints":
            return firstValue.converted(to: .pints).value
        case "Gallons":
            return firstValue.converted(to: .gallons).value
        default:
            return firstValue.converted(to: .liters).value
        }
    }
    let volumeUnitType = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    @State var volumeValueSelection = "Liters"
    @State var volumeResultSelection = "Liters"
    
    var body: some View {
        Section {
            HStack {
                ValueView(value: $value)
                Picker("", selection: $volumeValueSelection) {
                    ForEach(volumeUnitType, id: \.self) {
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
                Picker("", selection: $volumeResultSelection) {
                    ForEach(volumeUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Result")
        }
    }
}
