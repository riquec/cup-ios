//
//  ViewController.swift
//  Cup
//
//  Created by Henrique Jardim on 23/06/20.
//  Copyright © 2020 Jardim. All rights reserved.
//
import UIKit
import DIKit
import Observable

class ViewController: UIViewController, UITextFieldDelegate {
    fileprivate var disposables = Disposal()
    
    @LazyInject fileprivate var nicknameViewModel: NicknameViewModel

    @IBOutlet weak var goToCategoryButton: UIStackView!
    
    @IBOutlet weak var nicknameInputField: UITextFielBorderBottom!
    
    @IBAction func nicknameTextChange(_ sender: UITextFielBorderBottom) {
        if sender.currentColorIsRed(){
            sender.setLineColor(color: UIColor.black.cgColor)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initObservables()
        initListeners()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nicknameInputField.endEditing(true)
        return false
    }
    
    fileprivate func initObservables(){
        nicknameViewModel.shouldDisplayErrorObservable.observe { [weak self] shouldDisplay, _  in
            if (shouldDisplay) {
                print("oberservable should display error received event")
                self?.displayNicknameBlankError()
            }
        }.add(to: &disposables)
        
        nicknameViewModel.shouldNavigateToCategoryObservable.observe { shouldNavigate, _  in
            if (shouldNavigate) {
                print("oberservable should navigate to category received event")
            }
        }.add(to: &disposables)
    }
    
    fileprivate func disposeObservables() {
        disposables.dispose()
    }
    
    fileprivate func initListeners() {
        //dismiss keyboard click anywhere
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        //init press return listener
        nicknameInputField.delegate = self
        
        //listen when user wants navigate to category
        goToCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.validateInputNickname)))

    }
    
    fileprivate func displayNicknameBlankError(){
        nicknameInputField.setLineColor(color: UIColor.red.cgColor)
    }
    
    
    @objc fileprivate func dismissKeyboard() {
        nicknameInputField.endEditing(true)
    }
    
    @objc fileprivate func validateInputNickname() {
        nicknameViewModel.validateAndSaveNickname(nickname: nicknameInputField.text)
    }
}
