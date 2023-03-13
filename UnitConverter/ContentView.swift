//
//  ContentView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 13/03/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var value: Double = 0.0
    var result: Double {
        switch selection {
        case "Temperature":
            return 0.0
        case "Length":
            var unitType: UnitLength
            switch distanceValueSelection {
            case "Meters":
                unitType = UnitLength.meters
            case "Kilometers":
                unitType = UnitLength.kilometers
            case "Feet":
                unitType = UnitLength.feet
            case "Yards":
                unitType = UnitLength.yards
            case "Miles":
                unitType = UnitLength.miles
            default:
                unitType = UnitLength.meters
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
        case "Time":
            return 0.0
        case "Volume":
            return 0.0
        default:
            return 0.0
        }
    }
    
    @FocusState private var amountIsFocused: Bool
    let selectedUnitType = ["Temperature", "Length", "Time", "Volume"]
    @State var selection = "Length"
    
    let distanceUnitType = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    @State var distanceValueSelection = "Meters"
    @State var distanceResultSelection = "Meters"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type of unit", selection: $selection) {
                        ForEach(selectedUnitType, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Select type of units to convert")
                }
                
                Section {
                    HStack {
                        TextField("Value", value: $value, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        switch selection {
                        case "Temperature":
                            Text(distanceValueSelection)
                        case "Length":
                            Picker("", selection: $distanceValueSelection) {
                                ForEach(distanceUnitType, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(.navigationLink)
                        case "Time":
                            Text(distanceValueSelection)
                        case "Volume":
                            Text(distanceValueSelection)
                        default:
                            Text(distanceValueSelection)
                        }
                    }
                } header: {
                    Text("Value")
                }
                
                Section {
                    HStack {
                        Text(String(format: "%.2f", result))
                        switch selection {
                        case "Temperature":
                            Text(distanceResultSelection)
                        case "Length":
                            Picker("", selection: $distanceResultSelection) {
                                ForEach(distanceUnitType, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(.navigationLink)
                        case "Time":
                            Text(distanceResultSelection)
                        case "Volume":
                            Text(distanceResultSelection)
                        default:
                            Text(distanceResultSelection)
                        }
                    }
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}
