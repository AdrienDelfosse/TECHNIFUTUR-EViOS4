//
//  AddExpenseViewController.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//

import UIKit


protocol AddExpenseDelegate: AnyObject {
    func onSave(viewController: UIViewController)
    func onCancel(viewController: UIViewController)
}
class AddExpenseViewController: UIViewController {
    static let storyboardId = "AddExpenseViewController"
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var sectionTableView: UITableView!
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    weak var delegate : AddExpenseDelegate?
    var expenseSections = [ExpenseSection]()
    
    let expense  = ExpensesManager.shared.newExpense()
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.preferredDatePickerStyle = .wheels
            expenseSections = ExpensesManager.shared.fetchExpenseSection()
        
        sectionTableView.delegate = self
        sectionTableView.dataSource = self
        sectionTableView.register(UINib(nibName: ExpenseSectionTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: ExpenseSectionTableViewCell.cellIdentifier)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        if let name = nameTF.text, !name.isEmpty {
            
            if let value = valueTF.text, !value.isEmpty {
                expense.value = Float(valueTF.text!) ?? 0
                expense.date = datePicker.date
                expense.name = nameTF.text
                expense.expenseSection = expenseSections[sectionTableView.indexPathForSelectedRow?.row ?? 0]
               
                
                ExpensesManager.shared.saveData()
                
                delegate?.onSave(viewController: self)
                
            }
    }
    }
    
    
  
    
    
    @IBAction func onCancelClicked(_ sender: Any) {
        print("error")
        delegate?.onCancel(viewController: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddExpenseViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenseSections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sectionTableView.dequeueReusableCell(withIdentifier: ExpenseSectionTableViewCell.cellIdentifier, for: indexPath) as! ExpenseSectionTableViewCell
        
        let section = expenseSections[indexPath.row]
        
        cell.setupCell(expenseSection: section)
        
        return cell
    }
    
 
    
    

}
