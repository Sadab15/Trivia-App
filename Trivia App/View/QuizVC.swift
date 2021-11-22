//
//  BestCricketVC.swift
//  Trivia App
//
//  Created by differenz242 on 19/11/21.
//

import UIKit

class BestCricketVC: UIViewController {
    
    // MARK: Variables declearations
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblQue: UILabel!
    @IBOutlet weak var tblView: UITableView!
    var data = GameModel()
    let arr: [QuizModel] =
        [QuizModel(que: constant.kWhoIsBestCricker,
                   options: constant.kBestCricketerOptions,
                   multiSelection: false),
         QuizModel(que: constant.kWhatIsFlagColors,
                   options: constant.kFlagColorsOptions,
                   multiSelection: true)
        ]
    var currentQuiz:question = .bestCricketer
    var selectedIndex = -1
    var arrSelection = [false,false,false,false]
    
    // MARK: View Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Methode to initialSetup
    func initialSetup(){
        tblView.register(UINib(nibName: CellIdentifiers.cell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.cell)
        btnNext.setTitle(currentQuiz == .bestCricketer ? constant.kNext : constant.kSummery, for: .normal)
        lblQue.text = arr[currentQuiz.rawValue].questaion
    }
    
    // MARK: Methode to check validation
    func checkValidation() -> Bool{
        if currentQuiz == .bestCricketer{
            if selectedIndex == -1{
                return false
            }
        }else{
            if !arrSelection.contains(true){
                return false
            }
        }
        return true
    }

    // MARK: Buttons action
    // If current quiz is bestCricket so next screen is navigate to same VC and if quiz is flagColors than next screen is SummaryVc
    @IBAction func btnNext(_ sender: Any) {
        if checkValidation(){
            if currentQuiz == .bestCricketer{
                data.bestCricketer = arr[currentQuiz.rawValue].options[selectedIndex]
            }else{
                var colors = ""
                for i in 0...arrSelection.count - 1{
                    if arrSelection[i]{
                        colors.append(arr[currentQuiz.rawValue].options[i] + ",")
                    }
                }
                colors.removeLast()
                data.flagColors = colors
            }
            
            if currentQuiz == .bestCricketer{
                let vc = storyboard?.instantiateViewController(identifier: VCIdentifiers.cricketerVC) as! BestCricketVC
                vc.currentQuiz = question(rawValue: currentQuiz.rawValue + 1) ?? .bestCricketer
                vc.data = data
                navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = storyboard?.instantiateViewController(identifier: VCIdentifiers.summaryVC) as! SummaryVC
                vc.data = data
                navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            self.showAlert(with: ValidationMessages.selectAtleastOne)
        }
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

// MARK: TableView Methods
extension BestCricketVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr[currentQuiz.rawValue].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cell, for: indexPath) as! cell
        cell.lbl.text = arr[currentQuiz.rawValue].options[indexPath.row]
        
        if currentQuiz == .bestCricketer{
            cell.imgView.isHidden = !(indexPath.row == selectedIndex)
        }else{
            cell.imgView.isHidden = !(arrSelection[indexPath.row])
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentQuiz == .bestCricketer{
            selectedIndex = indexPath.row
        }else{
            arrSelection[indexPath.row] = !arrSelection[indexPath.row]
        }
        tblView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
