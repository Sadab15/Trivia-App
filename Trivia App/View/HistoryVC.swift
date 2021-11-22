//
//  HistoryVC.swift
//  Trivia App
//
//  Created by iMac on 20/11/21.
//

import UIKit

class HistoryVC: UIViewController {
    
    // MARK: Variables declearations
    @IBOutlet weak var lblNoData: UILabel!
    @IBOutlet weak var tblView: UITableView!
    var arr = GameModel.fetchData()
    
    // MARK: View Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfig()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Methode to initialSetup
    func initialConfig(){
        tblView.register(UINib(nibName: CellIdentifiers.cellHistory, bundle: nil), forCellReuseIdentifier: CellIdentifiers.cellHistory)
        lblNoData.isHidden = !(arr?.count == 0)
        tblView.isHidden = (arr?.count == 0)
        self.title = constant.kHistory
        
    }

}

// MARK: TableView Methods
extension HistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: CellIdentifiers.cellHistory, for: indexPath) as! cellHistory
        cell.data = arr![indexPath.row]
        cell.initialSetup()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        135
    }
    
}
