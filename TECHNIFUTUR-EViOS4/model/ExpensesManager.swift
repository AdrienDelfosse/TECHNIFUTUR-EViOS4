//
//  ExpensesManager.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//

import Foundation
import CoreData

class ExpensesManager{
    
    static let shared = ExpensesManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private lazy var managedObjectContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func setExpenseSection(){
        if !UserDefaultManager.shared.dataFilled {
            
           
            
            let expenseSectionImpots = ExpenseSection(context: managedObjectContext)
            
            expenseSectionImpots.name = "Impôts"
        
            
            let expenseSectionFood = ExpenseSection(context: managedObjectContext)
            
            expenseSectionFood.name = "Nourriture"
            
            let expenseSectionHome = ExpenseSection(context: managedObjectContext)
            
            expenseSectionHome.name = "Maison"
            
            let expenseSectionCar = ExpenseSection(context: managedObjectContext)
            
            expenseSectionCar.name = "Voiture"
            
            let expenseSectionHobby = ExpenseSection(context: managedObjectContext)
            
            expenseSectionHobby.name = "Loisirs"
            
            let expenseSectionOther = ExpenseSection(context: managedObjectContext)
            
            expenseSectionOther.name = "Autres"
        
        
        saveData()
            
            UserDefaultManager.shared.dataFilled = true
        }
        
    }
    
    func saveData() {
        do {
            try managedObjectContext.save()
        } catch {
            print("error ", error)
            managedObjectContext.rollback()
        }
    }
    
    func fetchExpenseSection() -> [ExpenseSection]{
        
        let fetchRequest = NSFetchRequest<ExpenseSection>(entityName: "ExpenseSection")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do{
            let expenseSection = try managedObjectContext.fetch(fetchRequest)
            return expenseSection
        } catch {
            print("could not fetch")
            return [ExpenseSection]()
        }
    }
    
    func newExpense(name: String, date : Date, value: Float) -> Expense {
        let expense = Expense(context: managedObjectContext)
        expense.date = date
        expense.name = name
        expense.value = value
        return expense
    }
    
   
    
    func newExpense() -> Expense {
        let expense = Expense(context: managedObjectContext)
        return expense
    }
    
}
