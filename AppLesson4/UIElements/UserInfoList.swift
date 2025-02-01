//
//  UserInfoList.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 31.01.2025.
//

import UIKit

final class UserInfoList: UITableView {
    private var sections: [SectionConfig<UITableViewCell, any Sendable>] = []
    
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
}

extension UserInfoList {
    func addSection(_ section: SectionConfig<UITableViewCell, any Sendable>) {
        register(section.typeCell, forCellReuseIdentifier: section.cellReuseIdentifier)
        sections.append(section)
    }
}

extension UserInfoList: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].dataCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: section.cellReuseIdentifier,
            for: indexPath
        )
        let item = section.dataCells[indexPath.row]
        section.configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
}
