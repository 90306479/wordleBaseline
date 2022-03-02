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
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var theWordLabel: UILabel!
    var targetWord: String = "MATCH"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boxOne.delegate = self
        boxTwo.delegate = self
        boxThree.delegate = self
        boxFour.delegate = self
        boxFive.delegate = self
        theWordLabel.text = targetWord
        
    }
    
    
    @IBAction func goButton(_ sender: Any) {
        let firstLet = getWordLetter(num: 0)
        let secLet = getWordLetter(num: 1)
        let thirdLet = getWordLetter(num: 2)
        let fourLet = getWordLetter(num: 3)
        let fifthLet = getWordLetter(num: 4)

        if boxOne.text == firstLet {
            boxOne.backgroundColor = UIColor.green
        } else if (boxOne.text == secLet || boxOne.text == thirdLet || boxOne.text == fourLet || boxOne.text == fifthLet) {
            boxOne.backgroundColor = UIColor.yellow
        }
        
        if boxTwo.text == secLet {
            boxTwo.backgroundColor = UIColor.green
        } else if (boxTwo.text == firstLet || boxTwo.text == thirdLet || boxTwo.text == fourLet || boxTwo.text == fifthLet){
            boxTwo.backgroundColor = UIColor.yellow
        }
        
        if boxThree.text == thirdLet {
            boxThree.backgroundColor = UIColor.green
        } else if (boxThree.text == secLet || boxThree.text == firstLet || boxThree.text == fourLet || boxThree.text == fifthLet) {
            boxThree.backgroundColor = UIColor.yellow
        }
        
        if boxFour.text == fourLet {
            boxFour.backgroundColor = UIColor.green
        } else if (boxFour.text == secLet || boxFour.text == thirdLet || boxFour.text == firstLet || boxFour.text == fifthLet) {
            boxFour.backgroundColor = UIColor.yellow
        }
        
        if boxFive.text == fifthLet {
            boxFive.backgroundColor = UIColor.green
        } else if (boxFive.text == secLet || boxFive.text == thirdLet || boxFive.text == fourLet || boxFive.text == firstLet) {
            boxFive.backgroundColor = UIColor.yellow
        }
        
        
        
    }
    
    func getWordLetter(num: Int) -> String {
        let start = targetWord.index(targetWord.startIndex, offsetBy: num)
        let end = targetWord.index(targetWord.startIndex, offsetBy: num)
        let range = start...end

        return String(targetWord[range])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.swiitchBasedNextTextField(textField)
        return true
    }
    
    private func swiitchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.boxOne:
            self.boxTwo.becomeFirstResponder()
        case self.boxTwo:
            self.boxThree.becomeFirstResponder()
        case self.boxThree:
            self.boxFour.becomeFirstResponder()
        case self.boxFour:
            self.boxFive.becomeFirstResponder()
        default:
            self.boxOne.resignFirstResponder()
        }
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "abcdefghijklmnopqrstuvwxyz"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        let newChapterSet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {return false}
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        return updateText.count < 2
        
    }


}

