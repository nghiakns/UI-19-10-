//
//  Segment0ViewController.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 24/10/2022.
//

import UIKit

class Segment0ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(ProjectTableViewCell.nib, forCellReuseIdentifier: ProjectTableViewCell.identifier)
        tableview.register(ProjectTableViewCell.nib, forCellReuseIdentifier: ProjectTableViewCell.identifier)
        tableview.allowsSelection = false
        if #available(iOS 15.0, *) {
            tableview.sectionHeaderTopPadding = 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableViewCell.identifier)
                as? ProjectTableViewCell else { return UITableViewCell() }
        cell.filldata(projectList: projectList[indexPath.row])
        if indexPath.row == projectList.count - 1 {
            cell.configSeparator()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }
    
}
