//
//  ValueView.swift
//  UnitConverter
//
//  Created by Pedro Acevedo on 13/03/23.
//

import SwiftUI

struct ValueView: View {
    @Binding var value: Double
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        TextField("Value", value: $value, format: .number)
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
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
