//
//  graphViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 07.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class graphViewController: UIViewController {
    
    var graphArray = [String]()
    
    @IBOutlet weak var graphTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...31{
            graphArray.append(String(i))
        }
        
        graphTableView.delegate = self
        graphTableView.dataSource = self
       
    }
    

}


extension graphViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return graphArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = graphArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    
}