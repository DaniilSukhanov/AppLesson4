//
//  ViewController.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Basic UI elements
    
    private let leadingInset: CGFloat = 16
    private lazy var mainInfoLabel: (String, CGFloat) -> UILabel = { content, size in
        let label = UILabel()
        label.font = .systemFont(ofSize: size)
        label.textColor = .black
        label.text = content
        return label
    }
    
    private lazy var subInfoLabel: (String) -> UILabel = { content in
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = content
        return label
    }

    private lazy var profilePie: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        return imageView
    }()
    // MARK: User info entries
    
    private lazy var sex = UserInfoEntry(heading: "Sex", info: "Woman")
    private lazy var work = UserInfoEntry(heading: "Work", info: "Apple Company (CEO) 👨‍💻")
    
    // MARK: definite
    
    private lazy var headStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .vertical
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        
        verticalStackView.addArrangedSubview(self.mainInfoLabel("Depp", 17))
        verticalStackView.addArrangedSubview(self.subInfoLabel("01.01.1999"))
        
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(profilePie)
        
        return horizontalStackView
    }()
    
    // MARK: Definition of Info Stack
    
    private lazy var userInfoStackView = InfoStackView()
    private lazy var familyInfoStackView = InfoStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeadStack()
        setupUserInfoStack()
        view.addSubview(sex)
        
        sex.translatesAutoresizingMaskIntoConstraints = false
        
        sex.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sex.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupHeadStack() {
        view.addSubview(headStackView)
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset)
        ])
    }
    
    private func setupUserInfoStack() {
        view.addSubview(userInfoStackView)
        [mainInfoLabel("User info", 19), sex, work, subInfoLabel("Family"), familyInfoStackView].forEach {
            userInfoStackView.addArrangedSubview($0)
        }
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoStackView.topAnchor.constraint(equalTo: headStackView.bottomAnchor, constant: 38),
            userInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset)
        ])
            
    }

}

