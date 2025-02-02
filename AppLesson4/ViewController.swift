//
//  ViewController.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {
    private enum Constant {
        
    }
    
    // MARK: Basic UI elements
    private let userInfoList = UserInfoList()
    
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
    
    // MARK: definite
    
    private lazy var headStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.addArrangedSubview(self.mainInfoLabel("Depp", 17))
        verticalStackView.addArrangedSubview(self.subInfoLabel("01.01.1999"))
        
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(profilePie)
        
        return horizontalStackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeadStack()
        setupUserInfoList()
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
    
    private func setupUserInfoList() {
        view.addSubview(userInfoList)
        userInfoList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoList.topAnchor.constraint(equalTo: headStackView.bottomAnchor),
            userInfoList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset),
            userInfoList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingInset),
            userInfoList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

