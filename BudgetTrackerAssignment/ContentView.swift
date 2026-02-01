//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    // MARK: - Budget Header
                    Text("Budget Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // TODO: Show remaining budget here
                    // Note: Budget can change color in certain cases
                    Text("Remaining: $\(String(format: "%.2f", viewModel.remainingBudget))")
                        .font(.title2)
                        .foregroundColor(viewModel.budgetColor)
                    
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Add Expense Form
                VStack(spacing: 15) {
                    
                    // TODO: TextField for expense name
                    TextField("Expense name", text: $expenseName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // TODO: TextField for expense amount
                    TextField("Amount", text: $expenseAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    
                    
                    Button {
                        // TODO: Add expense and remember to clear the fields
                        if let amount = Double(expenseAmount) {
                            viewModel.addExpense(name: expenseName, amount: amount)
                            expenseName = ""
                            expenseAmount = ""
                        }
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Expenses List
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expenses")
                        .font(.headline)
                    
                    // TODO: If there are no expenses, show "No expenses yet"
                    if viewModel.expenses.isEmpty {
                        Text("No expenses yet")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach($viewModel.expenses) { $expense in
                            // TODO: Wrap each expense in a NavigationLink
                            // Destination should be ExpenseDetailView(expense: $expense, viewModel: viewModel)
                            HStack {
                                NavigationLink {
                                    ExpenseDetailView(expense: $expense, viewModel: viewModel)
                                } label: {
                                    HStack {
                                        Text(expense.name)
                                        Spacer()
                                        Text("$\(String(format: "%.2f", expense.amount))")
                                    }
                                }
                                
                                // Inside the row, display:
                                // - Expense name
                                // - Expense amount
                                // - A delete button
                                Button {
                                    viewModel.removeExpense(expense: expense)
                                } label: {
                                    Text("Delete")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Budget Tracker")
    }
}

#Preview {
    ContentView()
}
