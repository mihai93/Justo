//
//  CustomView.swift
//  Justo
//
//  Created by user on 2017-11-22.
//  Copyright © 2017 Mihai. All rights reserved.
//

import Foundation

class DynamicViewController: UIViewController {
    
    var strings: [String]!
    
    override func loadView() {
        // super.loadView()   // DO NOT CALL SUPER
        
        view = UIView()
        view.backgroundColor = .lightGray
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        for string in strings {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = string
            stackView.addArrangedSubview(label)
        }
    }
}
