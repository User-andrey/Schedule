//
//  stankiViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 15.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class stankiViewController: UIViewController {
    
    var numberRowSelected: String?
    
    @IBOutlet weak var SR23Switch: UISwitch!
    @IBOutlet weak var SR3Switch: UISwitch!
    @IBOutlet weak var V4Switch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //загрузка данных
        let loadSR23Switch = UserDefaults.standard.bool(forKey: "SR2-3")
            if loadSR23Switch == true {
                SR23Switch.isOn = true
            }else{
                SR23Switch.isOn = false
            }
        let loadSR3Switch = UserDefaults.standard.bool(forKey: "SR3")
        if loadSR3Switch == true {
            SR3Switch.isOn = true
        }else{
            SR3Switch.isOn = false
        }
        let loadV4Switch = UserDefaults.standard.bool(forKey: "V4")
        if loadV4Switch == true {
            V4Switch.isOn = true
        }else{
            V4Switch.isOn = false
        }
        
        self.SR23Switch.addTarget(self, action: #selector(switchSR23Changed(paramTarget:)), for: .valueChanged)
        self.SR3Switch.addTarget(self, action: #selector(switchSR3Changed(paramTarget:)), for: .valueChanged)
        self.V4Switch.addTarget(self, action: #selector(switchV4Changed(paramTarget:)), for: .valueChanged)
    }
    // сохранение данных
    @objc func switchSR23Changed(paramTarget: UISwitch) {
        if paramTarget.isOn == true {
            saveSwitch(numberStanok: "SR2-3", valueSwitch: true)
        }else{
            saveSwitch(numberStanok: "SR2-3", valueSwitch: false)
        }
        
    }
    
    @objc func switchSR3Changed(paramTarget: UISwitch) {
        if paramTarget.isOn == true {
            saveSwitch(numberStanok: "SR3", valueSwitch: true)
        }else{
            saveSwitch(numberStanok: "SR3", valueSwitch: false)
        }
        
    }
    
    @objc func switchV4Changed(paramTarget: UISwitch) {
        if paramTarget.isOn == true {
            saveSwitch(numberStanok: "V4", valueSwitch: true)
        }else{
            saveSwitch(numberStanok: "V4", valueSwitch: false)
        }
        
    }

    
    func saveSwitch(numberStanok:String, valueSwitch:Bool) {
        UserDefaults.standard.set(valueSwitch, forKey: numberStanok)
    }
    
}
