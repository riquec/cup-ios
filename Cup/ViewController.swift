//
//  ViewController.swift
//  Cup
//
//  Created by Henrique Jardim on 23/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    fileprivate let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        initListeners()
    }
    
    private func initListeners() {
//        inputNickNameField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        inputNickNameField.endEditing(true)
        return false
    }
    
    @objc fileprivate func dismissKeyboard() {
//        inputNickNameField.endEditing(true)
    }
}
