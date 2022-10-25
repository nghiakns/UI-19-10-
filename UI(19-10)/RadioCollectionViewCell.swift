//
//  RadioCollectionViewCell.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 19/10/2022.
//

import UIKit

struct List {
    let radioLabel: String
    
    init(radioLabel: String) {
        self.radioLabel = radioLabel
    }
}

var list: [List] = [
    List(radioLabel: "問題なし"),
    List(radioLabel: "故障あり"),
    List(radioLabel: "チェック不要"),
    List(radioLabel: "めっちゃ長いボタンの中身だどうすんねん。こうやで。ええな。")
]


class RadioCollectionViewCell: UICollectionViewCell {

    static let nib = UINib(nibName: "RadioCollectionViewCell", bundle: nil)
    static let identifier = "radiocollectioncell"
    
    @IBOutlet weak var radioView: UIView!
    @IBOutlet weak var radioButtonView: UIButton!
    @IBOutlet weak var radioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        radioButtonView.layer.cornerRadius = radioButtonView.frame.height/2
        radioButtonView.clipsToBounds = true
        radioView.layer.cornerRadius = 5
    }
    
    func filldata(list: List) {
        radioLabel.text = list.radioLabel
    }

}
