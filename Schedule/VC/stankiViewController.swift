//
//  stankiViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 15.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class stankiViewController: UIViewController {
    
    var dateRowSelected: String?
    var numberSectionSelected: String?
    
    @IBOutlet weak var SR23Switch: UISwitch!
    @IBOutlet weak var SR3Switch: UISwitch!
    @IBOutlet weak var V4Switch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //загрузка данных
        loadSwitch()

        self.SR23Switch.addTarget(self, action: #selector(switchChanged(paramTarget:)), for: .valueChanged)
        self.SR3Switch.addTarget(self, action: #selector(switchChanged(paramTarget:)), for: .valueChanged)
        self.V4Switch.addTarget(self, action: #selector(switchChanged(paramTarget:)), for: .valueChanged)
    }
    
    
    
    // сохранение данных
    @objc func switchChanged(paramTarget: UISwitch ) {
        
        if paramTarget == SR23Switch {
            if paramTarget.isOn == true {
                saveSwitch(numberStanok: "SR2-3" + dateRowSelected!, valueSwitch: true)
            }else{
                saveSwitch(numberStanok: "SR2-3" + dateRowSelected!, valueSwitch: false)
            }
        }else if paramTarget == SR3Switch{
            if paramTarget.isOn == true {
                saveSwitch(numberStanok: "SR3" + dateRowSelected!, valueSwitch: true)
            }else{
                saveSwitch(numberStanok: "SR3" + dateRowSelected!, valueSwitch: false)
            }
        }else if paramTarget == V4Switch{
            if paramTarget.isOn == true {
                saveSwitch(numberStanok: "V4" + dateRowSelected!, valueSwitch: true)
            }else{
                saveSwitch(numberStanok: "V4" + dateRowSelected!, valueSwitch: false)
            }
        }
        
    }
    
    func saveSwitch(numberStanok:String, valueSwitch:Bool) {
        UserDefaults.standard.set(valueSwitch, forKey: numberStanok)
    }
    
    
    
    
    
    //Загрузка данных
    func loadSwitch() {
        
        
        
        let loadSR23Switch = UserDefaults.standard.bool(forKey: "SR2-3" + dateRowSelected!)
        if loadSR23Switch == true {
            SR23Switch.isOn = true
        }else{
            SR23Switch.isOn = false
        }
        
        
        let loadSR3Switch = UserDefaults.standard.bool(forKey: "SR3" + dateRowSelected!)
        if loadSR3Switch == true {
            SR3Switch.isOn = true
        }else{
            SR3Switch.isOn = false
        }
        
        let loadV4Switch = UserDefaults.standard.bool(forKey: "V4" + dateRowSelected!)
        if loadV4Switch == true {
            V4Switch.isOn = true
        }else{
            V4Switch.isOn = false
        }
    }
    
}


