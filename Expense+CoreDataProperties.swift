//
//  Expense+CoreDataProperties.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var value: Float
    @NSManaged public var expenseSection: ExpenseSection?

}

extension Expense : Identifiable {

}
