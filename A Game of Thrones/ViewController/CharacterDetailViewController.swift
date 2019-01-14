//
//  CharacterDetailViewController.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 12/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var nameStr : String! = ""
    var genderStr : String! = ""
    var bornStr : String! = ""
    var diedStr : String! = ""
    var fatherStr : String! = ""
    var motherStr : String! = ""
    var cultureStr : String! = ""
    var titleStr : String! = ""
    var playedStr : String! = ""
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var bornLabel: UILabel!
    @IBOutlet var diedLabel: UILabel!
    @IBOutlet var fatherLabel: UILabel!
    @IBOutlet var motherLabel: UILabel!
    @IBOutlet var cultureLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var playedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar title
        self.title = "Character Detail"
        
        // Set Character Detail
        nameLabel.text = "Name : " + nameStr
        genderLabel.text = "Gender : " + genderStr
        bornLabel.text = "Born : " + bornStr
        diedLabel.text = "Died : " + diedStr
        fatherLabel.text = "Father : " + fatherStr
        motherLabel.text = "Mother : " + motherStr
        cultureLabel.text = "Culture : " + cultureStr
        titleLabel.text = "Title : " + titleStr
        playedLabel.text = "Played By : " + playedStr
        

    }
    

   

}
