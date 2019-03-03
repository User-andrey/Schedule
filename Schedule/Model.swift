import Foundation

class ModelDate {
    
    //MARK: первый рабочий день в году (начало отсчета)
    func firstJobDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.hour = 6
        dateComponents.day = 31
        dateComponents.month = 12
        dateComponents.year = 2018
        let date = Calendar.current.date(from: dateComponents)
        return date!
    }
    
    //MARK: последний день месяца
    func lastDayOfMonth(month:Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.hour = 6
        dateComponents.day = 1
        dateComponents.month = month
        dateComponents.year = 2019
        var date = Calendar.current.date(from: dateComponents)
        date = Calendar.current.date(byAdding: .month, value: 1, to: date!)
        date = Calendar.current.date(byAdding: .day, value: -1, to: date!)
        return date!
    }
    
    //MARK: заполнение массива рабочими датами
    
    func allJobDates(firstJobDay:Date) -> Array<Date> {
        var allJobDatesArray = [Date]()
        let weekInSecond = TimeInterval(7 * 24 * 60 * 60)
        var firstJobDayInYear = firstJobDay
        for _ in 1...26 {
            for _ in 1...7 {
                allJobDatesArray.append(firstJobDayInYear)
                firstJobDayInYear = Calendar.current.date(byAdding: .day, value: 1, to: firstJobDayInYear) ?? firstJobDay
            }
            firstJobDayInYear += weekInSecond
        }
        return allJobDatesArray
    }
    
    //MARK: Заполнение массива с учетом выбранного месяца
    func selectMonth(jobArray: Array<Date>, selectMonth: Int) -> Array<String> {
        var selectMonthArray = [String]()
        let format = DateFormatter()
        let local = Locale(identifier: "ru_RU")
        format.locale = local
        for i in jobArray {
            let monthItem = Calendar.current.component(.month, from: i)
            if monthItem == selectMonth {
                format.dateFormat = "d MMM"
                let dateString = format.string(from: i)
                selectMonthArray.append(dateString)
            }
        }
        return selectMonthArray
    }
    
    func allMonth() -> Array<String> {
        var dateComponents = DateComponents()
        let format = DateFormatter()
        var monthArray = [String]()
        format.locale = Locale.init(identifier: "ru_RU")
        format.dateFormat = "LLLL"
        for i in 1...12 {
            dateComponents.month = i
            let date = Calendar.current.date(from: dateComponents)
            let month = format.string(from: date!)
            monthArray.append(month)
        }
        return monthArray
    }
    
}
