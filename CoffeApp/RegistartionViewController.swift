//
//  RegistartionViewController.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation
import UIKit

class RegistartionViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: CoffeTextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var acceptPasswordLAbel: UILabel!
    @IBOutlet weak var acceptPasswordTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configViews()
    }
    
    override func configViews() {
        emailLabel.text = "email"
        passwordLabel.text = "Пароль"
        acceptPasswordLAbel.text = "Повторите пароль"
        
        emailLabel.textColor = UIColor(named: "FieldColor")
        passwordLabel.textColor = UIColor(named: "FieldColor")
        acceptPasswordLAbel.textColor = UIColor(named: "FieldColor")
        
        
        emailTextField.placeholder = "example@example.ru"
        passwordTextField.placeholder = "password"
        acceptPasswordTextField.placeholder = "accept password"
        
        registrationButton.layer.cornerRadius = 22
        registrationButton.backgroundColor = UIColor(named: "ButtonColor")
        registrationButton.setTitleColor(UIColor(named: "ButtonTitleColor"), for: .normal)
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.layer.shadowColor = UIColor.black.cgColor
        registrationButton.layer.shadowOpacity = 0.2
        registrationButton.layer.shadowRadius = 3
        registrationButton.layer.masksToBounds = false
    }
}
