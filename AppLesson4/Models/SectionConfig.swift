//
//  SectionConfig.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 01.02.2025.
//

import UIKit

struct SectionConfig<Cell: UITableViewCell, T: Sendable> {
    let typeCell: Cell.Type
    let title: String?
    let dataCells: [T]
    let cellReuseIdentifier: String
    let configureCell: (Cell, T) -> Void
    
    init(
        title: String? = nil,
        items: [T],
        cellReuseIdentifier: String = UUID().uuidString,
        configureCell: @escaping (Cell, T) -> Void
    ) {
        self.typeCell = Cell.self
        self.title = title
        self.dataCells = items
        self.cellReuseIdentifier = cellReuseIdentifier
        self.configureCell = configureCell
    }
}

