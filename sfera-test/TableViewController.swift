//
//  TableViewController.swift
//  sfera-test
//
//  Created by Владислав Николаев on 28.08.2021.
//

import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
//            sampleTextField.placeholder = "Enter text here"
//            sampleTextField.font = UIFont.systemFont(ofSize: 15)
//            sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//            sampleTextField.autocorrectionType = UITextAutocorrectionType.no
//            sampleTextField.keyboardType = UIKeyboardType.default
//            sampleTextField.returnKeyType = UIReturnKeyType.done
//            sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//            sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//            sampleTextField.delegate = self
//            self.view.addSubview(sampleTextField)
        
        self.navigationItem.title = "Мульти таймер"
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Добавление таймеров"
        } else {
            return "Таймеры"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0) {
            return 1
        } else {
            return 10
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return CGFloat(200)
        } else {
            return CGFloat(44)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell()
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if (indexPath.section == 0) {
//            let tf = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
//            tf.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
//            cell.contentView.addSubview(tf)
//            let tf2 = UITextField(frame: CGRect(x: 0, y: 20, width: 300, height: 20))
//            tf2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
//            cell.contentView.addSubview(tf2)
            
            let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 15, width: 300, height: 40))
                sampleTextField.placeholder = "Название таймера"
                sampleTextField.font = UIFont.systemFont(ofSize: 15)
                sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
                sampleTextField.autocorrectionType = UITextAutocorrectionType.no
                sampleTextField.keyboardType = UIKeyboardType.default
                sampleTextField.returnKeyType = UIReturnKeyType.done
                sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
                sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            sampleTextField.delegate = self
            cell.addSubview(sampleTextField)
            
            let sampleTextField2 =  UITextField(frame: CGRect(x: 20, y: 70, width: 300, height: 40))
                sampleTextField2.placeholder = "Время в секундах"
                sampleTextField2.font = UIFont.systemFont(ofSize: 15)
                sampleTextField2.borderStyle = UITextField.BorderStyle.roundedRect
                sampleTextField2.autocorrectionType = UITextAutocorrectionType.no
                sampleTextField2.keyboardType = UIKeyboardType.default
                sampleTextField2.returnKeyType = UIReturnKeyType.done
                sampleTextField2.clearButtonMode = UITextField.ViewMode.whileEditing
                sampleTextField2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            sampleTextField2.delegate = self
            cell.addSubview(sampleTextField2)
            
            let button = UIButton(frame: CGRect(x: 20, y: 140, width: 300, height: 50))
              button.setTitle("Добавить", for: .normal)
              button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            cell.addSubview(button)
            
            cell.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
            return cell
            
        } else {
            cell.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            return cell
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
