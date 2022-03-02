//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Vivaan Baid on 02/03/22.
//

import Foundation

struct Expenseitem: Identifiable, Codable{
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}



