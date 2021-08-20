//
//  UITableView.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//
import Foundation
import UIKit
extension UITableView {
    func TVregisterClassDefaultIdentifier(cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: cellClass.tvc_defaultIdentifier)
    }
    func TV_dequeueReusableCellDefaultIdentifier<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.tvc_defaultIdentifier) as! T
    }
}
