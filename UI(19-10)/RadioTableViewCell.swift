//
//  RadioTableViewCell.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 19/10/2022.
//

import UIKit
import AlignedCollectionViewFlowLayout

class RadioTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let nib = UINib(nibName: "RadioTableViewCell", bundle: nil)
    static let identifier = "radiocell"
    
    @IBOutlet weak var separatorBot: UIView!
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
            self.collectionview.layoutIfNeeded()
            self.layoutIfNeeded()
            let contentSize = self.collectionview.collectionViewLayout.collectionViewContentSize
            return CGSize(width: contentSize.width, height: contentSize.height + 70)
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let coll = collectionView.dequeueReusableCell(withReuseIdentifier: RadioCollectionViewCell.identifier, for: indexPath) as? RadioCollectionViewCell else {return UICollectionViewCell()}
        coll.filldata(list: list[indexPath.row])
        return coll
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(RadioCollectionViewCell.nib, forCellWithReuseIdentifier: RadioCollectionViewCell.identifier)
        separatorBot.isHidden = true

        let alignedFlowLayout = collectionview?.collectionViewLayout as? AlignedCollectionViewFlowLayout
        alignedFlowLayout?.horizontalAlignment = .left
        alignedFlowLayout?.verticalAlignment = .top
        alignedFlowLayout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        alignedFlowLayout?.minimumLineSpacing = 5.0
        alignedFlowLayout?.minimumInteritemSpacing = 5.0
        self.collectionview.layoutIfNeeded()
        self.layoutIfNeeded()
        collectionview.reloadData()
    }
    
    func configSeparator() {
        separatorBot.isHidden = false
    }

    
}

