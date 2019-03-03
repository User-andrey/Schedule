//
//  graphViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 07.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class graphViewController: UIViewController {
    

    @IBOutlet weak var monthPicker: UIPickerView!
    @IBOutlet weak var graphTableView: UITableView!
    var date = Date()
    var modelDate = ModelDate()
    let timeZone = TimeZone.current
    var allJobDatesArray = [Date]()
    var selectMonthArray = [String]()
    var calendar = Calendar.current
    var allMonthPicker = [String]()

    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                graphTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
                graphTableView.delegate = self
                graphTableView.dataSource = self
                monthPicker.delegate = self
                monthPicker.dataSource = self
                
                let firstJobDayInYear = modelDate.firstJobDate()
                allJobDatesArray = modelDate.allJobDates(firstJobDay: firstJobDayInYear)
                let monthNow = calendar.component(.month, from: date)
                self.selectMonthArray = modelDate.selectMonth(jobArray: allJobDatesArray, selectMonth: monthNow)
                allMonthPicker = modelDate.allMonth()


            }


}











extension graphViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectMonthArray.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = selectMonthArray[indexPath.row]
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? stankiViewController {
            var indexPathSelect = graphTableView.indexPathForSelectedRow
            let rowFromDate = selectMonthArray[indexPathSelect!.row]
            let sectionFromDate = selectMonthArray[indexPathSelect!.section]
            destination.numberRowSelected = rowFromDate
            destination.numberSectionSelected = sectionFromDate
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
    
}

