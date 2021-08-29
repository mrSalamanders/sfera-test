//
//  TableViewController.swift
//  sfera-test
//
//  Created by Владислав Николаев on 28.08.2021.
//

import UIKit

/**
 Основной контроллер приложения
 */
class TableViewController: UITableViewController, UITextFieldDelegate {
    
    /**
     Поля ввода для названия и секунд
     */
    var tf1 = UITextField()
    var tf2 = UITextField()
    
    var timers = [TimerModel]() // коллекция для хранения моделей таймеров
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Мульти таймер"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
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
        if(section == 0) {
            return 1
        } else {
            return self.timers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return CGFloat(200)
        } else {
            return CGFloat(44) // по умолчанию высота строчки равна 44
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if (indexPath.section == 0) { // кастомизация ячейки таблицы, которая содержит кнопку и поля для ввода
            
            let inputField =  UITextField(frame: CGRect(x: 20, y: 15, width: cell.contentView.frame.width, height: 40))
            inputField.placeholder = "Название таймера"
            inputField.font = UIFont.systemFont(ofSize: 15)
            inputField.borderStyle = UITextField.BorderStyle.roundedRect
            inputField.autocorrectionType = UITextAutocorrectionType.no
            inputField.keyboardType = UIKeyboardType.default
            inputField.returnKeyType = UIReturnKeyType.done
            inputField.clearButtonMode = UITextField.ViewMode.whileEditing
            inputField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            inputField.delegate = self
            
            self.tf1 = inputField
            
            cell.contentView.addSubview(self.tf1)
            
            let inputField2 =  UITextField(frame: CGRect(x: 20, y: 70, width: cell.contentView.frame.width, height: 40))
            inputField2.placeholder = "Время в секундах"
            inputField2.font = UIFont.systemFont(ofSize: 15)
            inputField2.borderStyle = UITextField.BorderStyle.roundedRect
            inputField2.autocorrectionType = UITextAutocorrectionType.no
            inputField2.keyboardType = UIKeyboardType.default
            inputField2.returnKeyType = UIReturnKeyType.done
            inputField2.clearButtonMode = UITextField.ViewMode.whileEditing
            inputField2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            inputField2.delegate = self
            
            self.tf2 = inputField2
            
            cell.contentView.addSubview(self.tf2)
            
            let button = UIButton(type: .roundedRect)
            button.frame = CGRect(x: 20, y: 140, width: cell.contentView.frame.width, height: 50)
            button.backgroundColor = UIColor.lightGray
            button.setTitle("Добавить", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            cell.contentView.addSubview(button)
            
            cell.sizeToFit()
            return cell
            
        } else { // катомизация ячейки для списка таймеров
            
            let timerTitle = UILabel(frame: CGRect(x: 20, y: 5, width: 300, height: 34))
            timerTitle.text = self.timers[indexPath.row].title
            
            cell.contentView.addSubview(timerTitle)
            
            let timerValue = UILabel(frame: CGRect(x: cell.frame.width, y: 5, width: 100, height: 34))
            
            /**
             https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
             */
            let (_, m, s) = secondsToHoursMinutesSeconds(seconds: self.timers[indexPath.row].seconds ?? 0)
            
            if (m < 10) {
                if (s < 10) {
                    timerValue.text = "0\(m):0\(s)"
                } else {
                    timerValue.text = "0\(m):\(s)"
                }
            } else {
                if (s < 10) {
                    timerValue.text = "\(m):0\(s)"
                } else {
                    timerValue.text = "\(m):\(s)"
                }
            }
            
            timerValue.textColor = UIColor.lightGray
            cell.contentView.addSubview(timerValue)
            
            return cell
        }
    }
    
    /**
     Ивент для кнопки "Добавить"
     */
    @objc func buttonAction(sender: UIButton!) {
        
        if (tf1.text != "") {
            let tm = TimerModel()
            
            tm.title = tf1.text ?? "NO TITLE"
            tm.seconds = Int(tf2.text ?? "0")
            tm.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                if tm.seconds ?? 0 > 0 {
                    tm.seconds! -= 1
                    if (tm.seconds == 0) {
                        self.timers.removeAll { $0.seconds ?? 0 <= 0 }
                    }
                    
                    self.timers = self.timers.sorted() { $0.seconds! > $1.seconds! } // 
                    
                    UIView.performWithoutAnimation { // не самое изящное решение
                        self.tableView.reloadSections(IndexSet(integer: 1), with: .none)
                    }
                } else {
                    tm.timer?.invalidate()
                }
            })
            RunLoop.current.add(tm.timer!, forMode: .common) // позволяет таймеру тикать при перемещении таблицы
            tm.timer!.tolerance = 0.3
            self.timers.append(tm)
            self.tableView.reloadData()
        }
        
    }
    
    /**
     https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
     */
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
