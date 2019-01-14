//
//  CharacterCell.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 12/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {


    @IBOutlet var BookCharacterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
