//
//  graphViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 07.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class graphViewController: UIViewController {
    
    @IBOutlet weak var changeMonthStepperOutlet: UIStepper!
    @IBOutlet weak var graphTableView: UITableView!

    
    var jobArray = [Date]()
    var selectMonthNumber = 3
    var selectMonthComponents = DateComponents()
    let format = DateFormatter()
    var selectMonthArray = [String]()
    let myDate = Date()
    let weekInSecond = TimeInterval(7 * 24 * 60 * 60)

    

    
    
    
    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                graphTableView.delegate = self
                graphTableView.dataSource = self
                var calendarComponents = Calendar.current.dateComponents([.year, .month, .day, .hour] , from: myDate)
                let dayToday = calendarComponents.day
                let monthToday = calendarComponents.month
                var firstJobDayInYear = Calendar.current.date(byAdding: .day, value: -dayToday!, to: myDate)
                firstJobDayInYear = Calendar.current.date(byAdding: .month, value: -monthToday! + 1, to: firstJobDayInYear!)
                selectMonthComponents.year = 2019
                selectMonthComponents.month = selectMonthNumber
                selectMonthComponents.day = 1
                let selectDate = Calendar.current.date(from: selectMonthComponents)
                
                // заполнение массива всеми рабочими датами
                for _ in 1...26 {
                    for _ in 1...7 {
                        jobArray.append(firstJobDayInYear!)
                        firstJobDayInYear = Calendar.current.date(byAdding: .day, value: 1, to: firstJobDayInYear!)
                    }
                    firstJobDayInYear! += weekInSecond
                }
                
                //последний день выбранного месяца
                var lastDayOfSelectMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectDate!)
                lastDayOfSelectMonth = Calendar.current.date(byAdding: .day, value: -1, to: lastDayOfSelectMonth!)
                selectMonthFunc(selectMonth: monthToday!)
                changeMonthStepperOutlet.value = Double(monthToday!)
            
            }


    
    
    

    

    @IBAction func changeMonthStepper(_ sender: Any) {
        let valueStepper = Int(changeMonthStepperOutlet.value)
        
        selectMonthArray.removeAll()
        selectMonthFunc(selectMonth: valueStepper)
        graphTableView.reloadData()
    }
    
    func AllJobDaysFunc() {
        
    }
    
    //MARK: Заполнение массива с учетом выбранного месяца
    func selectMonthFunc(selectMonth: Int) {
        for i in jobArray {
            
            let monthItem = Calendar.current.component(.month, from: i)
            if monthItem == selectMonth {
                format.dateFormat = "d MMM"
                let dateString = format.string(from: i)
                selectMonthArray.append(dateString)
            }
        }
        
        navigationController?.title = "\(selectMonthArray.count) рабочих дней"
        
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
        return 70.0
    }
    
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? stankiViewController {
            var indexPathSelect = graphTableView.indexPathForSelectedRow
            let rowFromDate = jobArray[indexPathSelect!.row]
            let sectionFromDate = jobArray[indexPathSelect!.section]
            let rowInString = format.string(from: rowFromDate)
            let sectionInString = format.string(from: sectionFromDate)
            
            destination.numberRowSelected = rowInString
            destination.numberSectionSelected = sectionInString
        }
    }
   

        
        
}



