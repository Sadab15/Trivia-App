//
//  ViewController.swift
//  Trivia
//
//  Created by differenz242 on 19/11/21.
//

import UIKit
class ViewController: UIViewController {
    
    // MARK: Variables declearations
    @IBOutlet weak var txtFeild: UITextField!
    
    // MARK: View Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        txtFeild.text = ""
    }
    
    // MARK: Methode to check validation
    func checkValidation() -> Bool{
        if txtFeild.text == ""{
            self.showAlert(with: ValidationMessages.insertName)
            return false
        }
        return true
    }

    // MARK: Buttons action
    @IBAction func btnStartGame(_ sender: Any) {
        if checkValidation(){
            self.view.endEditing(true)
            let vc = storyboard?.instantiateViewController(identifier: VCIdentifiers.cricketerVC) as! BestCricketVC
        vc.data.name = txtFeild.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func btnHistory(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: VCIdentifiers.historyVC) as! HistoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

