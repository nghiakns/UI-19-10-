//
//  TakePhotoTableViewCell.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 19/10/2022.
//

import UIKit

class TakePhotoTableViewCell: UITableViewCell {
    
    static let nib = UINib(nibName: "TakePhotoTableViewCell", bundle: nil)
    static let identifier = "takephotocell"
    @IBOutlet weak var separatorBot: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorBot.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configSeparator() {
        separatorBot.isHidden = false
    }
    
}
