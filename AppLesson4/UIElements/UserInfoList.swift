//
//  UserInfoList.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 31.01.2025.
//

import UIKit

final class UserInfoList: UITableView {
    private enum Constants {
        static let tableStyle: UITableView.Style = .grouped
        static let separatorStyle: UITableViewCell.SeparatorStyle = .singleLine
        static let rowHeight: CGFloat = UITableView.automaticDimension
        static let estimatedRowHeight: CGFloat = 44
        static let headerFontSize: CGFloat = 13
        static let headerHeight: CGFloat = 40
        static let cornerRadius: CGFloat = 10
    }
    
    private var sections: [AnySectionConfig] = []
    
    init() {
        super.init(frame: .zero, style: Constants.tableStyle)
        dataSource = self
        delegate = self
        separatorStyle = Constants.separatorStyle
        separatorColor = AppColor.separator
        rowHeight = Constants.rowHeight
        estimatedRowHeight = Constants.estimatedRowHeight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSection(_ section: AnySectionConfig) {
        section.registerCell(in: self)
        sections.append(section)
    }
}

extension UserInfoList: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionConfig = sections[indexPath.section]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: sectionConfig.cellReuseIdentifier,
            for: indexPath
        )
        sectionConfig.configureCell(cell, forRow: indexPath.row)
        cell.roundCorners(for: indexPath, in: tableView)
        return cell
    }
}

extension UserInfoList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        label.text = sections[section].title
        label.font = .systemFont(ofSize: Constants.headerFontSize)
        label.textColor = AppColor.secondText
        label.backgroundColor = AppColor.background
        label.frame = CGRect(origin: .zero, size: CGSize(width: tableView.bounds.width, height: Constants.headerHeight))
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.headerHeight
    }
}

fileprivate extension UITableViewCell {
    func roundCorners(for indexPath: IndexPath, in tableView: UITableView, cornerRadius: CGFloat = 10) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        var roundingCorners: UIRectCorner = []
        
        if indexPath.row == 0 {
            roundingCorners.insert([.topLeft, .topRight])
        }
        if indexPath.row == numberOfRows - 1 {
            roundingCorners.insert([.bottomLeft, .bottomRight])
        }
        
        let maskLayer = CAShapeLayer()
        let maskRect = CGRect(x: bounds.minX, y: bounds.minY, width: tableView.bounds.width, height: bounds.height)
        maskLayer.path = UIBezierPath(
            roundedRect: maskRect,
            byRoundingCorners: roundingCorners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        ).cgPath
        
        layer.mask = maskLayer
    }
}
