//
//  BudgetViewModel.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

@Observable class BudgetViewModel {
    var expenses: [Expense] = []
    
    var remainingBudget: Double {
        // TODO: Calculate the remaining budget
        // Hint: Start with 500.0 and subtract the sum of all expense amounts
        let startingBudget = 500.0
        var totalSpent = 0.0
        
        for expense in expenses {
            totalSpent = totalSpent + expense.amount
        }
        
        return startingBudget - totalSpent
    }
    
    var budgetColor: Color {
        // TODO: Return .green if remainingBudget > 0, otherwise .red
        if remainingBudget > 0 {
            return .green
        } else {
            return .red
        }
    }
    
    func addExpense(name: String, amount: Double) {
        // TODO: Create a new Expense and add it to the expenses array
        let newExpense = Expense(name: name, amount: amount)
        expenses.append(newExpense)
    }
    
    func removeExpense(expense: Expense) {
        // TODO: Find the index of the given expense and remove it from the array
        if let index = expenses.firstIndex(where: { $0.id == expense.id }) {
            expenses.remove(at: index)
        }
    }
}
