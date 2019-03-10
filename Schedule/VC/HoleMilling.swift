//
//  HoleMilling.swift
//  Schedule
//
//  Created by Егоров Андрей on 10/03/2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class HoleMilling: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var holeDiameter: UITextField!
    @IBOutlet weak var toolDiameter: UITextField!
    @IBOutlet weak var coordinateX: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func plusMinusButton(_ sender: Any) {
        let coordinate = Int(coordinateX.text!)
        coordinateX.text = "\(coordinate! * (-1))"
    }
    
    @IBAction func resultButton(_ sender: Any) {
        let holeDia = Int(holeDiameter.text!)
        let toolDia = Int(toolDiameter.text!)
        let coordX = Int(coordinateX.text!)
        let offset = (holeDia! - toolDia!) / 2
        resultLabel.text = "X = \(coordX! + offset) I = \(-offset)"
    }
    

    @IBAction func tapAction(_ sender: Any) {
        holeDiameter.resignFirstResponder()
        toolDiameter.resignFirstResponder()
        coordinateX.resignFirstResponder()
    }
    
    
}
