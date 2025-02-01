//
//  UserInfoList.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 31.01.2025.
//

import UIKit

final class UserInfoList: UITableView {
    private var data: [String: [UITableViewCell]] = .init()
    
    init() {
        super.init(frame: .zero, style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserInfoList: UITableViewDelegate {
    
}

extension UserInfoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    
}
