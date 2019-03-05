
import UIKit

class SaveClass {
    
    //Загрузка данных
    func stanokCount(date: String) -> Int {
        
        var count = 0
        
        let loadSR23Switch = UserDefaults.standard.bool(forKey: "SR2-3" + date)
        if loadSR23Switch == true {
            count += 1
        }
        
        
        let loadSR3Switch = UserDefaults.standard.bool(forKey: "SR3" + date)
        if loadSR3Switch == true {
            count += 1
        }
        
        let loadV4Switch = UserDefaults.standard.bool(forKey: "V4" + date)
        if loadV4Switch == true {
            count += 1
        }
        
        return count
    }
    
    
    func sumMoney(selectMonthArray: Array<String>) -> Int {
        var allMoney = 0
        for i in selectMonthArray{
            var money = stanokCount(date: i)
            money = money * 12 * 105
            allMoney += money
        }
        return allMoney
    }
    
    
    
    
}
