//
//  UIImageView.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//
import Foundation
import UIKit
extension UIImageView {
    func setImageCover(poster: String) {
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w185/\(poster)")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: posterURL!)
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }
    }
    func setImageBackdrop(backdrop: String) {
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w1280/\(backdrop)")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: backdropURL!)
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }
    }
    
}
