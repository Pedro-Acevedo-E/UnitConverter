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
    let selectedUnitType = ["Temperature", "Length", "Time", "Volume"]
    @State var selection = "Length"
    
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
                switch selection {
                case "Temperature":
                    TemperatureView(value: $value)
                case "Length":
                    DistanceView(value: $value)
                case "Time":
                    DurationView(value: $value)
                case "Volume":
                    Text("volume")
                default:
                    Text("error")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}
