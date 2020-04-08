//
//  ViewController.swift
//  2020-04-13-CoronaVirusTable-Huimin-Jiang
//
//  Created by Huimin Jiang on 4/6/20.
//  Copyright © 2020 Huimin Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let countryNameArray = ["United States", "Spain", "Italy", "France", "Germany", "China", "Iran", "United Kingdom", "Turkey", "Switzerland"]
        
    let totalCasesArray = [400412, 141942, 135586, 109069, 107663, 81802, 62589, 55242, 34109, 22253]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCasesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countryNameArray[indexPath.row]
        cell.detailTextLabel?.text = "\(totalCasesArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            //creating a date object that is today
            let today = Date()
            //creating a DateFormatter object to format how the date should be displayed
            let formatter = DateFormatter()
            formatter.dateStyle = .short // .short means date will be displayed in dd/mm/yy
            formatter.timeStyle = .none // .none means no time will be displayed
    
            let date = formatter.string(from: today)  //format the date
            return "Virus Cases by Country on " + date
    }

    
}
