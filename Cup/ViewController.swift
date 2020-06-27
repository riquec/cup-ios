//
//  ViewController.swift
//  Cup
//
//  Created by Henrique Jardim on 23/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var goToCategoryButton: UIStackView!
    
    @IBOutlet weak var nicknameInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initListeners()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nicknameInputField.endEditing(true)
        return false
    }
    
    fileprivate func initListeners() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        nicknameInputField.delegate = self
    }
    
    @objc fileprivate func dismissKeyboard() {
        nicknameInputField.endEditing(true)
    }
}
