//
//  ViewController.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 19/10/2022.
//

import UIKit

class Segment1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    private var tableData = [TableViewSectionMapper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TakePhotoTableViewCell.nib, forCellReuseIdentifier: TakePhotoTableViewCell.identifier)
        tableview.register(RadioTableViewCell.nib, forCellReuseIdentifier: RadioTableViewCell.identifier)
        reloadData()
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))

        tableview.rowHeight = UITableView.automaticDimension
    }
    
    func reloadData() {
        tableData.removeAll()
        var sect1 = TableViewSectionMapper()
        sect1.addCell(makeCell: makeTakePhotoCell(_:_:))
        tableData.append(sect1)
        var sect2 = TableViewSectionMapper()
        sect2.addCell(makeCell: makeRadioCell(_:_:))
        sect2.addCell(makeCell: makeTakePhotoCell(_:_:))
        tableData.append(sect2)
        var sect3 = TableViewSectionMapper()
        sect3.addCell(makeCell: makeRadioCell(_:_:))
        sect3.addCell(makeCell: makeTakePhotoCell(_:_:))
        tableData.append(sect3)
        var sect4 = TableViewSectionMapper()
        sect4.addCell(makeCell: makeTakePhotoCell(_:_:))
        sect4.addCell(makeCell: makeRadioCell(_:_:))
        tableData.append(sect4)
        tableview.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableData[indexPath.section].cells[indexPath.row].makeCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
            case 1:
                let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
                let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
                headerView.addSubview(titleLabel)
                titleLabel.text = "点検機器Bグループ"
                return headerView
            case 2:
                let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
                let titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
                headerView.addSubview(titleLabel)
                titleLabel.text = "点検機器Cグループ"
                return headerView
        default:
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            case 1, 2:
                return 40
            case 3:
                return 15
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    private func makeTakePhotoCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TakePhotoTableViewCell.identifier)
                as? TakePhotoTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if indexPath.row == tableData[indexPath.section].cells.count - 1 {
            cell.configSeparator()
        }
        return cell
    }
    
    private func makeRadioCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RadioTableViewCell.identifier) as? RadioTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        if indexPath.row == tableData[indexPath.section].cells.count - 1 {
            cell.configSeparator()
        }
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        return cell
    }

}

