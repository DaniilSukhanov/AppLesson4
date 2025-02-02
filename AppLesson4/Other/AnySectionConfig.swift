//
//  AnySectionConfig.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 02.02.2025.
//
import UIKit

protocol AnySectionConfig {
    var cellReuseIdentifier: String { get }
    var title: String? { get }
    var numberOfItems: Int { get }
    func registerCell(in tableView: UITableView)
    func configureCell(_ cell: UITableViewCell, forRow row: Int)
}

