//
//  ConfigurableCell.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 02.02.2025.
//

protocol ConfigurableCell {
    associatedtype Model
    func setup(with model: Model)
}
