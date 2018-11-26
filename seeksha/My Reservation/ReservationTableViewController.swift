//
//  ReservationTableViewController.swift
//  seeksha
//
//  Created by moblie on 21/11/2018.
//  Copyright © 2018 lbh. All rights reserved.
//

import UIKit

struct DateSection : Comparable {
    
    var date : Date
    var reservations : [Reservation]
    
    static func < (lhs: DateSection, rhs: DateSection) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func == (lhs: DateSection, rhs: DateSection) -> Bool {
        return lhs.date == rhs.date
    }
    
}

struct Reservation {
    
    var date : Date
    var restaurants : String
    var menu : String
    var cost : String
}

fileprivate func parseDate(_ str : String) -> Date {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd HH:mm"
    return (dateFormat.date(from: str)!)
}

class ReservationTableViewController: UITableViewController {


    var sections = [DateSection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groups = Dictionary(grouping: self.reservations) { (Reservation) in
            return Reservation.date
           }
        self.sections = groups.map(DateSection.init(date:reservations:)).sorted()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - this items are example for prototype
    
    var reservations = [
        Reservation(date: parseDate("2018-11-20 12:10"), restaurants: "신전 떡볶이", menu : "치즈떡볶이, 치즈신전컵밥, 김말이", cost: "7,500"),
        Reservation(date: parseDate("2018-11-21 13:16"), restaurants: "사보텐", menu: "히레 카츠 정식", cost: "13,000"),
        Reservation(date: parseDate("2018-11-21 18:43"), restaurants: "맛나 감자탕", menu: "맛나감자탕 中", cost: "29,000"),
        ]

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let section = self.sections[section]
        return section.reservations.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        return dateFormatter.string(from: date)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reservation18112101Cell", for: indexPath)

        let section = self.sections[indexPath.section]
        let reservations = section.reservations[indexPath.row]
        cell.textLabel?.text = reservations.restaurants
        cell.detailTextLabel?.text = reservations.menu + "  " + reservations.cost

        return cell
    }
   

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath)
//
//        // Configure the cell...
//
//        cell.textLabel?.text = settings[(indexPath as NSIndexPath).row]
//
//        return cell
//    }
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
