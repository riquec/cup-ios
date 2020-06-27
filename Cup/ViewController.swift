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
        
        setupViews()
        initListeners()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nicknameInputField.endEditing(true)
        return false
    }
    
    fileprivate func setupViews(){
        nicknameInputField.addBottomBorderBlack()
    }
    
    fileprivate func initListeners() {
        //dismiss keyboard click anywhere
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        //init press return listener
        nicknameInputField.delegate = self
        
        //listen when user wants navigate to category
        goToCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.validateInputAndGoToCategory)))
    }
    
    fileprivate func saveNicknameAndNavigateToCategory(){
        print("saveNicknameAndNavigateToCategory")
    }
    
    fileprivate func displayNicknameBlankError(){
        print("displayNicknameBlankError")
    }
    
    fileprivate func isBlankNickname() -> Bool {
        return nicknameInputField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }
    
    @objc fileprivate func dismissKeyboard() {
        nicknameInputField.endEditing(true)
    }
    
    @objc fileprivate func validateInputAndGoToCategory() {
        isBlankNickname() ? displayNicknameBlankError() : saveNicknameAndNavigateToCategory()
    }
}
