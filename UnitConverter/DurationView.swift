//
//  DurationView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 13/03/23.
//

import SwiftUI

struct DurationView: View {
    @Binding var value: Double
    var result: Double {
        let firstValue: Measurement<UnitDuration>
        switch durationValueSelection {
        case "Seconds":
            firstValue = Measurement(value: value, unit: .seconds)
        case "Minutes":
            firstValue = Measurement(value: value, unit: .minutes)
        case "Hours":
            firstValue = Measurement(value: value, unit: .hours)
        case "Days":
            firstValue = Measurement(value: value * 24, unit: .hours)
        default:
            firstValue = Measurement(value: value, unit: .seconds)
        }
        switch durationResultSelection {
        case "Seconds":
            return firstValue.converted(to: UnitDuration.seconds).value
        case "Minutes":
            return firstValue.converted(to: UnitDuration.minutes).value
        case "Hours":
            return firstValue.converted(to: UnitDuration.hours).value
        case "Days":
            return firstValue.converted(to: UnitDuration.hours).value / 24
        default:
            return firstValue.converted(to: UnitDuration.seconds).value
        }
    }
    let durationUnitType = ["Seconds", "Minutes", "Hours", "Days"]
    @State var durationValueSelection = "Minutes"
    @State var durationResultSelection = "Minutes"
    
    var body: some View {
        Section {
            HStack {
                ValueView(value: $value)
                Picker("", selection: $durationValueSelection) {
                    ForEach(durationUnitType, id: \.self) {
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
                Picker("", selection: $durationResultSelection) {
                    ForEach(durationUnitType, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
        } header: {
            Text("Result")
        }
    }
}
