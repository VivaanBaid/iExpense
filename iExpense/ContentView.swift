//
//  ContentView.swift
//  iExpense
//
//  Created by Vivaan Baid on 24/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myexpenses = expenses()
    @State private var isShowingAddView = false
    var body: some View{
        NavigationView{
            List{
                ForEach(myexpenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            if item.amount < 10 {
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(Color.accentColor)
                                Text(item.type)
                            }else{
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(Color.purple)
                                Text(item.type)
                            }
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }

                }.onDelete(perform: removeItems)
            }
            .navigationBarTitle(Text("iExpense"))
            .toolbar {
                Button {
                    isShowingAddView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $isShowingAddView, onDismiss: nil) {
                AddView(expenses: myexpenses)
            }
        }

    }
    func removeItems(at offsets: IndexSet) {
        myexpenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
