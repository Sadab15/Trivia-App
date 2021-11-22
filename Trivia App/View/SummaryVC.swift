//
//  SummaryVC.swift
//  Trivia App
//
//  Created by iMac on 19/11/21.
//

import UIKit

class SummaryVC: UIViewController {
    
    // MARK: Variables declearations
    var data = GameModel()
    @IBOutlet weak var lblFlagColors: UILabel!
    @IBOutlet weak var lblFavCricketer: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    // MARK: View Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Methode to initialSetup
    func initialSetup(){
        lblName.text = data.name
        lblFavCricketer.text = constant.kAnswer + data.bestCricketer
        lblFlagColors.text = constant.kAnswer + data.flagColors
    }
    
    // MARK: Methode used to get currentDate And Time
    func getCurrentDate() -> String{
        let df = DateFormatter()
        df.dateFormat = constant.dateFormat
        return df.string(from: Date())
    }
    
    // MARK: Buttons action
    @IBAction func btnFinish(_ sender: Any) {
        data.date = getCurrentDate()
        GameModel.saveData(data: data)
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func btnHistory(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: VCIdentifiers.historyVC) as! HistoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
