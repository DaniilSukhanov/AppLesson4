//
//  SectionConfig.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 01.02.2025.
//

import UIKit


struct SectionConfig<Cell: UITableViewCell & ConfigurableCell, T: Sendable>: AnySectionConfig where Cell.Model == T {
    let title: String?
    let dataCells: [T]
    let cellReuseIdentifier: String
    
    init(
        title: String? = nil,
        items: [T],
        cellReuseIdentifier: String = String(describing: Cell.self)
    ) {
        self.title = title
        self.dataCells = items
        self.cellReuseIdentifier = cellReuseIdentifier
    }
    
    var numberOfItems: Int {
        dataCells.count
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.register(Cell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func configureCell(_ cell: UITableViewCell, forRow row: Int) {
        guard let cell = cell as? Cell else {
            return
        }
        cell.setup(with: dataCells[row])
    }
}

