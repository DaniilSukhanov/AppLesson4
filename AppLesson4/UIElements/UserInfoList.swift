//
//  UserInfoList.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 31.01.2025.
//

import UIKit

final class UserInfoList: UITableView {
    private var sections: [AnySectionConfig] = []
    
    init() {
        super.init(frame: .zero, style: .plain)
        dataSource = self
        separatorStyle = .none
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 44
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
}

