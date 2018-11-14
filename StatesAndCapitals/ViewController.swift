//
//  ViewController.swift
//  StatesAndCapitals
//
//  Created by James Chun on 11/6/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let stateList: [(state: String, shortName: String, capital: String)] = [
        ("Alabama", "AL", "Montgomery"),
        ("Alaska", "AK", "Juneau"),
        ("Arizona", "AZ", "Pheonix"),
        ("Arkansas", "AR", "Little Rock"),
        ("California", "CA", "Sacramento"),
        ("Colorado", "CO", "Denver"),
        ("Connecticut", "CT", "Hartford"),
        ("Delaware", "DE", "Dover"),
        ("Florida", "FL", "Tallahassee"),
        ("Georgia", "GA", "Atlanta"),
        ("Hawaii", "HI", "Honolulu"),
        ("Idaho", "ID", "Boise"),
        ("Illinois", "IL", "Springfield"),
        ("Indiana", "IN", "Indianapolis"),
        ("Iowa", "IA", "Des Moines"),
        ("Kansas", "KA", "Topeka"),
        ("Kentucky", "KY", "Frankfort"),
        ("Louisiana", "LA", "Baton Rouge"),
        ("Maine", "ME", "Augusta"),
        ("Maryland", "MD", "Annapolis"),
        ("Massachusetts", "MA", "Boston"),
        ("Michigan", "MI", "Lansing"),
        ("Minnesota", "MN", "St. Paul"),
        ("Mississippi", "MS", "Jackson"),
        ("Missouri", "MO", "Jefferson City"),
        ("Montana", "MT", "Helena"),
        ("Nebraska", "NE", "Lincoln"),
        ("Nevada", "NV", "Carson City"),
        ("New Hampshire", "NH", "Concord"),
        ("New Jersey", "NJ", "Trenton"),
        ("New Mexico", "NM", "Santa Fe"),
        ("New York", "NY", "Albany"),
        ("North Carolina", "NC", "Raleigh"),
        ("North Dakota", "ND", "Bismarck"),
        ("Ohio", "OH", "Columbus"),
        ("Oklahoma", "OK", "Oklahoma City"),
        ("Oregon", "OR", "Salem"),
        ("Pennsylvania", "PA", "Harrisburg"),
        ("Rhode Island", "RI", "Providence"),
        ("South Carolina", "SC", "Columbia"),
        ("South Dakota", "SD", "Pierre"),
        ("Tennessee", "TN", "Nashville"),
        ("Texas", "TX", "Austin"),
        ("Utah", "UT", "Salt Lake City"),
        ("Vermont", "VT", "Montpelier"),
        ("Virginia", "VA", "Richmond"),
        ("Washington", "WA", "Olympia"),
        ("West Virginia", "WV", "Charleston"),
        ("Wisconsin", "WI", "Madison"),
        ("Wyoming", "WY", "Cheyenne"),
    ]
    
    @IBOutlet weak var abbreviation: UILabel!
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var showAnswerButton: UIButton!
    
    var currentStateIndex: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
        
        abbreviation.backgroundColor = UIColor.white
        abbreviation.layer.borderWidth = 5
        abbreviation.layer.cornerRadius = 20
        abbreviation.layer.borderColor = UIColor.red.cgColor
        
    	updateResult()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "type your answer...";
        } else {
            textField.resignFirstResponder();    //Hide keyboard.
        }
        return true;    //The text field should do its default behavior.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { //why doesn't this work?
        let yourAnswer: String = textField.text!.lowercased()
        let answer: String = stateList[currentStateIndex].capital.lowercased()
        print(yourAnswer)
        print(answer)
        if yourAnswer == answer {
            result.text = "You got it!"
        } else {
            result.text = "Incorrect!"
        }
    }

    
    @IBAction func nextState(_ sender: Any) {
        currentStateIndex += 1
        if currentStateIndex >= stateList.count {
            currentStateIndex = 0
        }
        updateResult()
    }
    
    @IBAction func prevState(_ sender: Any) {
        currentStateIndex -= 1
        if currentStateIndex <= 0 {
            currentStateIndex = 49
        }
        updateResult()
        
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        result.text = "\(stateList[currentStateIndex].capital)"
        showAnswerButton.isEnabled = false
    }
    
    func updateResult() {
        stateName.text = stateList[currentStateIndex].state
		abbreviation.text = stateList[currentStateIndex].shortName
        result.text = "what is your answer?"
        showAnswerButton.isEnabled = true
    }
    
}

