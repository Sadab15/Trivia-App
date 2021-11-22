//
//  cellHistory.swift
//  Trivia App
//
//  Created by iMac on 20/11/21.
//

import UIKit

class cellHistory: UITableViewCell {

    // MARK: Variables declearations
    @IBOutlet weak var lblColors: UILabel!
    @IBOutlet weak var lblFavCricketer: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    var data = GameModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Methode to initialSetup
    func initialSetup(){
        lblDate.text = "Game \(data.id): \(data.date)"
        lblName.text = "Name : \(data.name)"
        lblFavCricketer.text = "Answer: \(data.bestCricketer)"
        lblColors.text = "Answer: \(data.flagColors)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
