//
//  OnlyTextCell.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 02.02.2025.
//

import UIKit

final class OnlyTextCell: UITableViewCell, ConfigurableCell {
    typealias Model = String
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = AppColor.secondBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with model: Model) {
        var configuration = defaultContentConfiguration()
        configuration.text = model
        configuration.textProperties.color = AppColor.text
        contentConfiguration = configuration
    }
}

