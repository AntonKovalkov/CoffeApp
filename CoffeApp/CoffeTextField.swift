//
//  CoffeTextField.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import UIKit

class CoffeTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        layer.cornerRadius = 22
        layer.borderWidth = 2
        layer.masksToBounds = true
        layer.borderColor = UIColor(named: "FieldColor")?.cgColor
        textColor = UIColor(named: "FieldColor")
    }
}
