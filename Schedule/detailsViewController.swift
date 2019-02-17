//
//  detailsViewController.swift
//  Schedule
//
//  Created by Егоров Андрей on 07.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var detaliTableView: UITableView!
    var detaliArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...8{
            detaliArray.append(String(i))
        }
        
        detaliTableView.delegate = self
        detaliTableView.dataSource = self
        
    }
    
    
    
}
    
extension detailsViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return detaliArray.count
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = detaliArray[indexPath.row] + " деталь"
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70.0
        }
    


}

