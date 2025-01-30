//
//  FamilyMemberEntry.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 30.01.2025.
//

import UIKit

final class FamilyMemberEntry: UIStackView {
    private lazy var memberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private lazy var birthdateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private lazy var infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private func setupInfoStack() {
        infoStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(birthdateLabel)
    }
    
    init(member: String, name: String, birthdate: String) {
        super.init(frame: .zero)
        setupInfoStack()
        backgroundColor = .white
        axis = .vertical
        
        memberLabel.text = member
        memberLabel.textColor = .black
        nameLabel.text = name
        nameLabel.textColor = .black
        birthdateLabel.text = birthdate
        birthdateLabel.textColor = .black
        
        
        
        [memberLabel, infoStack].forEach {
            addArrangedSubview($0)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

