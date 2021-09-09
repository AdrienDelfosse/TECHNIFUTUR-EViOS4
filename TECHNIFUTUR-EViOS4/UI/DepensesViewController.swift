//
//  DepensesViewController.swift
//  TECHNIFUTUR-EViOS4
//
//  Created by Student05 on 09/09/2021.
//

import UIKit

class DepensesViewController: UIViewController {

    @IBOutlet weak var expensesTableView: UITableView!
    
    var expenseSections = [ExpenseSection]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExpensesManager.shared.setExpenseSection()
        
        expenseSections = ExpensesManager.shared.fetchExpenseSection()
        
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        expensesTableView.register(UINib(nibName: ExpenseTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: ExpenseTableViewCell.cellIdentifier)
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didPressAddButton(_ sender: Any) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: AddExpenseViewController.storyboardId) as? AddExpenseViewController else {
            return
        }
        
        viewController.delegate = self
        
        self.present(viewController, animated: true, completion: nil)
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

extension DepensesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return expenseSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return expenseSections[section].name
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.gray
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseSections[section].expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: ExpenseTableViewCell.cellIdentifier, for: indexPath) as! ExpenseTableViewCell
        
        if let expense = (expenseSections[indexPath.section].expenses?.sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as? [Expense])?[indexPath.row] {
            
            cell.setupCell(expense: expense)

        }
        
        return cell
    }
    
    
    
}

extension DepensesViewController: AddExpenseDelegate {
    func onCancel(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func onSave(viewController: UIViewController) {
        expensesTableView.reloadData()
        viewController.dismiss(animated: true, completion: nil)
    }
}
