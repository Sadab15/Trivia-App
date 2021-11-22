//
//  GameModel.swift
//  Trivia
//
//  Created by differenz242 on 19/11/21.
//

import Foundation
import UIKit
import CoreData

// This is a model for use to save ans of the quiz
class GameModel : NSObject {
    // MARK: Variables declearations
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static var context:NSManagedObjectContext!
    var id: Int = 0
    var name: String = ""
    var bestCricketer: String = ""
    var flagColors: String = ""
    var date: String = ""
    init(id:Int = 0, name:String = "", cricketer:String = "", colors:String = "", date:String = "")
    {
        self.id = id
        self.name = name
        self.bestCricketer = cricketer
        self.flagColors = colors
        self.date = date
    }
    
    
    // MARK: This is used for save quiz ans in coredata
    class func saveData(data:GameModel)
    {
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: kTableName, in: context)
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        newData.setValue(data.name, forKey: kName)
        newData.setValue(data.bestCricketer, forKey: kFavCricketer)
        newData.setValue(data.flagColors, forKey: kColors)
        newData.setValue(data.date, forKey: kDate)
        
        print("Storing Data..")
        do {
            try context.save()
        } catch {
            print("Storing data Failed")
        }
        
        
    }
    
    // MARK: This is used for fetch datas from coredata
    class func fetchData() -> [GameModel]?
    {
        print("Fetching Data..")
        context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: kTableName)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            var arr : [GameModel] = []
            var count = 0
            for data in result as! [NSManagedObject] {
                count += 1
                let name = data.value(forKey: kName) as? String ?? ""
                let favCricketer = data.value(forKey: kFavCricketer) as? String ?? ""
                let flagColors = data.value(forKey: kColors) as? String ?? ""
                let date = data.value(forKey: kDate) as? String ?? ""
                arr.append(GameModel(id:count, name: name, cricketer: favCricketer, colors: flagColors,date: date))
            }
            return arr
        } catch {
            print("Fetching data Failed")
            return nil
        }
    }
}


