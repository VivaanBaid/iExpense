//
//  Expenses.swift
//  iExpense
//
//  Created by Vivaan Baid on 02/03/22.
//

import Foundation
class expenses: ObservableObject{
    @Published var items = [Expenseitem](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let saveditems = UserDefaults.standard.data(forKey: "Items"){
            if let decoded_items = try? JSONDecoder().decode([Expenseitem].self, from: saveditems){
                items = decoded_items
                return
            }
        }
        
        items = []
        
    }
    
}
