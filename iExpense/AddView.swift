//
//  AddView.swift
//  iExpense
//
//  Created by Vivaan Baid on 02/03/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0
    
    @ObservedObject var expenses: expenses
    
    @Environment(\.dismiss) var dismiss
    
    

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let mine = Expenseitem(name: name, type: type, amount: amount)
                    expenses.items.append(mine)
                    dismiss()
                }

            }
        }
    }
}
