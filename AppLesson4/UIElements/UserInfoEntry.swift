//
//  UserInfoEntry.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 30.01.2025.
//

import UIKit


final class UserInfoEntry: UIStackView {
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    init(heading: String, info: String) {
        super.init(frame: .zero)
        setup(heading: heading, info: info)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        axis = .vertical
        
        [headingLabel, infoLabel].forEach {
            addArrangedSubview($0)
        }
        
        [headingLabel, infoLabel].forEach {
            $0.textColor = .black
        }

    }
    
    func setup(heading: String, info: String) {
        headingLabel.text = heading
        infoLabel.text = info
    }
    
}
