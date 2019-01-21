//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Austin Cole on 1/21/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var songDurationTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addSongButtonWasTapped(_ sender: Any) {
    }
    
}
