//
//  ProjectTableViewCell.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 24/10/2022.
//

import UIKit

struct ProjectList {
    let projectName: String
    
    init(projectName: String) {
        self.projectName = projectName
    }
}

let projectList: [ProjectList] = [
    ProjectList(projectName: "点検機器Bグループ"),
    ProjectList(projectName: "点検機器Dグループ")
]

class ProjectTableViewCell: UITableViewCell {
    
    static let identifier = "projectCell"
    static let nib = UINib(nibName: "ProjectTableViewCell", bundle: nil)
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var separatorBot: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorBot.isHidden = true
    }
    
    func filldata(projectList: ProjectList) {
        projectLabel.text = projectList.projectName
    }
    
    func configSeparator() {
        separatorBot.isHidden = false
    }
}
