//
//  ViewController.swift
//  SillySong
//
//  Created by Jasmeet Singh on 2018-12-26.
//  Copyright © 2018 Jusmyth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = "Enter your name to show a silly song"
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if (["", nil].contains(nameField.text)) {
            lyricsView.text = "Please enter your name"
        }
        else {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(_ name: String) -> String {
    var shortName: String = name.lowercased()
    for char in shortName {
        if (["a","e","i","o","u"].contains(char)) {
            break
        }
        else {
            shortName.remove(at: shortName.startIndex)
        }
    }
    return shortName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(fullName))
    
    return lyrics
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
