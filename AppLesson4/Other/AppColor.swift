//
//  AppColor.swift
//  AppLesson4
//
//  Created by Даниил Суханов on 02.02.2025.
//
import UIKit

fileprivate extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
   }
}

enum AppColor {
    static let background = UIColor(hex: 0xF2F2F7)
    static let secondBackground = UIColor(hex: 0xFFFFFF)
    static let text = UIColor(hex: 0x000000)
    static let secondText = UIColor(hex: 0x8E8E93)
    static let separator = UIColor(hex: 0xB9B9BB)
}
