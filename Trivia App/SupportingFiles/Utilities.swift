//
//  Utilities.swift
//  Trivia
//
//  Created by differenz242 on 19/11/21.
//

import Foundation
import UIKit

enum question : Int {
    case bestCricketer, flagColors
}

struct VCIdentifiers{
    static let cricketerVC = "BestCricketVC"
    static let colorVC = "ColorsVC"
    static let summaryVC = "SummaryVC"
    static let historyVC = "HistoryVC"
}

struct ValidationMessages{
    static let insertName = "Please insert your name."
    static let selectAtleastOne = "Please select atleast one option"
}

struct CellIdentifiers {
    static let cell = "cell"
    static let cellHistory = "cellHistory"
}

struct constant {
    static let kBestCricketerOptions = ["Sachin Tendulkar","Virat Kolli","Adam Gilchirst","Jacques Kallis"]
    static let kFlagColorsOptions = ["White","Yellow","Orange","Green"]
    static let kWhoIsBestCricker = "Who is the best cricketer in the world?"
    static let kWhatIsFlagColors = "What are the colors in the national flag?"
    static let kHistory = "History"
    static let kSummery = "Summary"
    static let kNext = "Next"
    static let kAnswer = "Answer: "
    static let dateFormat = "yyyy-MM-dd hh:mm a"
}


let kTableName = "History"
let kName = "name"
let kFavCricketer = "fav_cricketer"
let kColors = "colors"
let kDate = "date"

extension UIViewController {
    func showAlert(withTitle title: String = "", with message: String, firstButton: String = "OK", firstHandler: ((UIAlertAction) -> Void)? = nil, secondButton: String? = nil, secondHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButton, style: .default, handler: firstHandler))
        if secondButton != nil {
            alert.addAction(UIAlertAction(title: secondButton!, style: .default, handler: secondHandler))
        }
        present(alert, animated: true)
    }
}
