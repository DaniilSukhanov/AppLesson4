//
//  ViewController.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 30.01.2025.
//

import UIKit

fileprivate enum MockData {
    static let sections: [AnySectionConfig] = [
        SectionConfig<OnlyTextCell, String>(title: "SEX", items: ["Male"]),
        SectionConfig<OnlyTextCell, String>(title: "WORK", items: ["Apple Company (CEO)"]),
        SectionConfig<OnlyTextCell, String>(title: "UNIVERSITY", items: ["Higher School of Economics"]),
        SectionConfig<ShortInfoCell, ShortInfoCell.Model>(
            title: "FAMILY",
            items: [
                .init(title: "Husband", subtitle: "Olaf Sukhantsov 01.01.1990"),
                .init(title: "Children", subtitle: "Dima Sukhantsov 01.01.1990"),
                .init(title: "Children", subtitle: "Kiril Sukhantsov 01.01.1990")
            ]
        )
    ]
    static let birthday = "01.01.1990"
    static let name = "Dima Bilan"
    static let old: CGFloat = 17
}

class ViewController: UIViewController {
    private enum Constant {
        static let leadingInset: CGFloat = 16
        static let mainInfoFontSize: CGFloat = 18
        static let subInfoFontSize: CGFloat = 14
        static let profileImageSize: CGFloat = 50
        static let profileCornerRadius: CGFloat = 25
        static let headStackViewTopInset: CGFloat = 16
        static let image = "profile"
    }
    
    // MARK: Basic UI elements
    private let userInfoList: UserInfoList = {
        let table = UserInfoList()
        table.backgroundColor = AppColor.background
        return table
    }()
    
    private lazy var mainInfoLabel: (String, CGFloat) -> UILabel = { content, size in
        let label = UILabel()
        label.font = .systemFont(ofSize: size)
        label.textColor = AppColor.text
        label.text = content
        return label
    }
    
    private lazy var subInfoLabel: (String) -> UILabel = { content in
        let label = UILabel()
        label.font = .systemFont(ofSize: Constant.subInfoFontSize)
        label.textColor = AppColor.secondText
        label.text = content
        return label
    }

    private lazy var profilePie: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constant.image))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constant.profileCornerRadius
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: Constant.profileImageSize),
            imageView.heightAnchor.constraint(equalToConstant: Constant.profileImageSize)
        ])
        return imageView
    }()
    
    // MARK: definite
    
    private lazy var headStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.addArrangedSubview(self.mainInfoLabel(MockData.name, Constant.mainInfoFontSize))
        verticalStackView.addArrangedSubview(self.subInfoLabel(MockData.birthday))
        
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(profilePie)
        
        return horizontalStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.background
        setupHeadStack()
        setupUserInfoList()
    }
    
    private func setupHeadStack() {
        view.addSubview(headStackView)
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.headStackViewTopInset),
            headStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.leadingInset)
        ])
    }
    
    private func setupUserInfoList() {
        view.addSubview(userInfoList)
        userInfoList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoList.topAnchor.constraint(equalTo: headStackView.bottomAnchor),
            userInfoList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.leadingInset),
            userInfoList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.leadingInset),
            userInfoList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        for section in MockData.sections {
            userInfoList.addSection(section)
        }
        userInfoList.reloadData()
    }
}
