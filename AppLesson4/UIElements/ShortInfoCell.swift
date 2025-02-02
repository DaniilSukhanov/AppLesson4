//
//  ShortInfoCell.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 02.02.2025.
//

import UIKit

final class ShortInfoCell: UITableViewCell, ConfigurableCell {
    struct Model {
        let title: String
        let subtitle: String
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = AppColor.secondBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with model: Model) {
        var configuration = defaultContentConfiguration()
        
        configuration.text = model.title
        configuration.textProperties.color = AppColor.text
        
        configuration.secondaryText = model.subtitle
        configuration.secondaryTextProperties.color = AppColor.secondText
        
        contentConfiguration = configuration
    }
}
