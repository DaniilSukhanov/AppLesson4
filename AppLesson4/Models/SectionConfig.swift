//
//  SectionConfig.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 01.02.2025.
//

import UIKit

struct SectionConfig<T: Sendable> {
    let title: String?
    let dataCells: [T]
    let cellReuseIdentifier: String
    let configureCell: (UITableViewCell, T) -> Void
    
    init(title: String? = nil,
         items: [T],
         cellReuseIdentifier: String,
         configureCell: @escaping (UITableViewCell, T) -> Void) {
        self.title = title
        self.dataCells = items
        self.cellReuseIdentifier = cellReuseIdentifier
        self.configureCell = configureCell
    }
}

