//
//  ExpenseDetailView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

struct ExpenseDetailView: View {
    @Binding var expense: Expense
    @State var viewModel: BudgetViewModel
    @State private var expenseNameText: String = ""
    @State private var expenseAmountText: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Expense Info")) {
                // TODO: Create a row for editing the expense name
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("", text: $expenseNameText)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: expenseNameText) { oldValue, newValue in
                            expense.name = newValue
                        }
                }
                
                // TODO: Create a row for editing the expense amount
                HStack {
                    Text("Amount")
                    Spacer()
                    TextField("", text: $expenseAmountText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .onChange(of: expenseAmountText) { oldValue, newValue in
                            if let amount = Double(newValue) {
                                expense.amount = amount
                            }
                        }
                }
            }
            
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            expenseNameText = expense.name
            expenseAmountText = String(format: "%.2f", expense.amount)
        }
        
    }
}


#Preview {
    ExpenseDetailView(expense: .constant(Expense(name: "Pizza", amount: 56.34)), viewModel: BudgetViewModel())
}
