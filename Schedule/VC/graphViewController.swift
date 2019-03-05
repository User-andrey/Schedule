//
//  graphViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 07.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class graphViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        graphTableView.reloadData()
        allMoney = saveClass.sumMoney(selectMonthArray: selectMonthArray)
        navigationController?.topViewController?.title = "\(allMoney)₽"
    }
    

    @IBOutlet weak var monthPicker: UIPickerView!
    @IBOutlet weak var graphTableView: UITableView!
    
    
    var date = Date()
    var modelDate = ModelDate()
    let timeZone = TimeZone.current
    var allJobDatesArray = [Date]()
    var selectMonthArray = [String]()
    var calendar = Calendar.current
    var allMonthPicker = [String]()
    var saveClass = SaveClass()
    var allMoney = 0
    

    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                graphTableView.delegate = self
                graphTableView.dataSource = self
                monthPicker.delegate = self
                monthPicker.dataSource = self
                
                let firstJobDayInYear = modelDate.firstJobDate()
                allJobDatesArray = modelDate.allJobDates(firstJobDay: firstJobDayInYear)
                let monthNow = calendar.component(.month, from: date)
                self.selectMonthArray = modelDate.selectMonth(jobArray: allJobDatesArray, selectMonth: monthNow)
                allMonthPicker = modelDate.allMonth()
                
                allMoney = saveClass.sumMoney(selectMonthArray: selectMonthArray)
                
                
                navigationController?.topViewController?.title = "\(allMoney)₽"
                monthPicker.selectRow(monthNow - 1, inComponent: 0, animated: true)
                
                
            }


}





extension graphViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }

}



extension graphViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectMonthArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GraphTableViewCell
        cell.dateLabel.text = selectMonthArray[indexPath.row]
        let stanokCount = saveClass.stanokCount(date: selectMonthArray[indexPath.row])
        
        if stanokCount > 1 {
            cell.infoLabel.text = "\(stanokCount) станка"
        }else if stanokCount == 0{
            cell.infoLabel.text = ""
        }else{
            cell.infoLabel.text = "\(stanokCount) станок"
        }
        
        let moneyInHour = stanokCount * 12 * 105
        cell.moneyLable.text = "\(moneyInHour)₽"
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? stankiViewController {
            var indexPathSelect = graphTableView.indexPathForSelectedRow
            let rowFromDate = selectMonthArray[indexPathSelect!.row]
            destination.dateRowSelected = rowFromDate
        }
    }
 
    

}




extension graphViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allMonthPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allMonthPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectMonthArray = modelDate.selectMonth(jobArray: allJobDatesArray, selectMonth: row + 1)
        graphTableView.reloadData()
    }
    
    
    
}

