//
//  LoadVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 20/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

final class LoadVC: UIViewController {
    var spinner: UIActivityIndicatorView!
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        spinner = UIActivityIndicatorView(style: .medium)
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                spinner.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ]
        )
        self.view = view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spinner.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        spinner.stopAnimating()
    }
}
