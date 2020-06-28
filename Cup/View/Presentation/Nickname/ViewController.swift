//
//  ViewController.swift
//  Cup
//
//  Created by Henrique Jardim on 23/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//
import UIKit
import Resolver

class ViewController: UIViewController, UITextFieldDelegate {
    fileprivate let nicknameViewModel: NicknameViewModel = Resolver.resolve()

    @IBOutlet weak var goToCategoryButton: UIStackView!
    
    @IBOutlet weak var nicknameInputField: UITextField!
    
    @IBAction func nicknameTextChange(_ sender: UITextField) {
        if sender.currentColorIsRed() {
            sender.setBorderColor(color: UIColor.black.cgColor)
        }
    }
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
        nicknameViewModel.saveNickname(nickname: nicknameInputField.text ?? "empty")
    }
    
    fileprivate func displayNicknameBlankError(){
        nicknameInputField.setBorderColor(color: UIColor.red.cgColor)
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
