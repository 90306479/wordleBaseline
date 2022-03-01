//
//  ViewController.swift
//  Wordle
//
//  Created by 90306479 on 3/1/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var boxOne: UITextField!
    
    @IBOutlet weak var boxTwo: UITextField!
    
    @IBOutlet weak var boxThree: UITextField!
    
    @IBOutlet weak var boxFour: UITextField!
    
    @IBOutlet weak var boxFive: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boxOne.delegate = self
        boxTwo.delegate = self
        boxThree.delegate = self
        boxFour.delegate = self
        boxFive.delegate = self
        
    }
    
    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {return false}
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updateText.count < 2
        
    }


}

