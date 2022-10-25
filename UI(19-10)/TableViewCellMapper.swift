//
//  TableViewCellMapper.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 20/10/2022.
//

import Foundation
import UIKit

struct TableViewCellMapper {

    let makeCell: (UITableView, IndexPath) -> UITableViewCell
//    let cellSelection: (UITableView, IndexPath) -> Void

}

struct TableViewSectionMapper {

    var cells = [TableViewCellMapper]()

    mutating func addCell(
        makeCell: @escaping (UITableView, IndexPath) -> UITableViewCell
//        cellSelection: @escaping (UITableView, IndexPath) -> Void
    ) {
        cells.append(TableViewCellMapper(makeCell: makeCell))
    }

}
