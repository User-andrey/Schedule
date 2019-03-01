import Foundation

class ModelClass {
    
    
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
    
}
