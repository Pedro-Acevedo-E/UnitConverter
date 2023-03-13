//
//  DistanceView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 13/03/23.
//

import SwiftUI

struct DistanceView: View {
    @Binding var value: Double
    var result: Double {
        var unitType: UnitLength
        switch distanceValueSelection {
        case "Meters":
            unitType = .meters
        case "Kilometers":
            unitType = .kilometers
        case "Feet":
            unitType = .feet
        case "Yards":
            unitType = .yards
        case "Miles":
            unitType = .miles
        default:
            unitType = .meters
        }
        let firstValue = Measurement(value: value, unit: unitType)
        switch distanceResultSelection {
        case "Meters":
            return firstValue.converted(to: UnitLength.meters).value
        case "Kilometers":
            return firstValue.converted(to: UnitLength.kilometers).value
        case "Feet":
            return firstValue.converted(to: UnitLength.feet).value
        case "Yards":
            return firstValue.converted(to: UnitLength.yards).value
        case "Miles":
            return firstValue.converted(to: UnitLength.miles).value
        default:
            return firstValue.converted(to: UnitLength.meters).value
        }
    }
    let distanceUnitType = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    @State var distanceValueSelection = "Meters"
    @State var distanceResultSelection = "Meters"
    
    
    var body: some View {
        Section {
            HStack {
                ValueView(value: $value)
                Picker("", selection: $distanceValueSelection) {
                    ForEach(distanceUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Value")
        }
        
        Section {
            HStack {
                Text(String(format: "%.2f", result))
                Picker("", selection: $distanceResultSelection) {
                    ForEach(distanceUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Result")
        }
    }
}
