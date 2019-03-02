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
    var date = Date()
    var modelDate = ModelDate()
    let timeZone = TimeZone.current
    var allJobDatesArray = [Date]()
    var selectMonthArray = [String]()
    var calendar = Calendar.current

    
            override func viewDidLoad() {
                super.viewDidLoad()
                
                graphTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
                graphTableView.delegate = self
                graphTableView.dataSource = self
                
                let firstJobDayInYear = modelDate.firstJobDate()
                allJobDatesArray = modelDate.allJobDates(firstJobDay: firstJobDayInYear)
                let monthNow = calendar.component(.month, from: date)
                self.selectMonthArray = modelDate.selectMonth(jobArray: allJobDatesArray, selectMonth: monthNow)


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



//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if let destination = segue.destination as? stankiViewController {
//            var indexPathSelect = graphTableView.indexPathForSelectedRow
//            let rowFromDate = jobArray[indexPathSelect!.row]
//            let sectionFromDate = jobArray[indexPathSelect!.section]
//            let rowInString = format.string(from: rowFromDate)
//            let sectionInString = format.string(from: sectionFromDate)
//
//            destination.numberRowSelected = rowInString
//            destination.numberSectionSelected = sectionInString
//        }
//    }




}



