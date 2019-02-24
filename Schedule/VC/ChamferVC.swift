//
//  ChamferVC.swift
//  Schedule
//
//  Created by Егоров Андрей on 19.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class ChamferVC: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func answerButton(_ sender: Any) {
        let dia = text1.text
        let glubina = text2.text
        
        let diaDouble = Double(dia!)
        let glubinaDouble = Double(glubina!)
        
        if text1.text == "" || text2.text == "" || text3.text == ""{
            outputLabel.text = "Введите данные"
        }else if diaDouble! <= (glubinaDouble! * 2) {
            outputLabel.text = "Неверные данные"
        }else{
            raschet()
        }
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        text1.resignFirstResponder()
        text2.resignFirstResponder()
        text3.resignFirstResponder()
    }
    
    
    @IBAction func plusMinusButton(_ sender: Any) {
        if text3.text != "" {
            var text31 = text3.text!
            let perviySimvol = text31[text31.startIndex]
            if perviySimvol == "-" {
                text31.removeFirst()
                text3.text = text31
            }else{
                text3.text = "-" + text31
            }
        }
    }
    
    func raschet() {
        let dia = text1.text
        let glubina = text2.text
        let koord = text3.text
        
        let diaDouble = Double(dia!)
        let glubinaDouble = Double(glubina!)
        let koordDouble = Double(koord!)
        
        let answer = (diaDouble! - (glubinaDouble! * 2)) / 2
        outputLabel.text = "X\(koordDouble! + answer)  I-\(answer)"
    }
    
}
