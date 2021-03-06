//
//  RestaurantListTableViewController.swift
//  seeksha
//
//  Created by moblie on 28/11/2018.
//  Copyright © 2018 lbh. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    var resLists = ["맛나 감자탕", "엄청난 해장국", "목장과 바다"]
    var resDesLists = ["1인 감자탕" ,"선지해장국, 내장탕", "삼겹살"]
        
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resListCell", for: indexPath)

        // Configure the cell...

       cell.textLabel?.text = resLists[indexPath.row]
       cell.detailTextLabel?.text = resDesLists[indexPath.row]
        
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let MenuIndex = indexPath.row
     
        //UIStoryboardSegue.init(identifier: "LToMSegue", source: UIViewController, destination: RestaurantMenuViewController)
        let dest = RestaurantMenuViewController()
        
        self.present(dest, animated: true, completion: nil)
        self.performSegue(withIdentifier: "LToMSegue", sender: self)
        
        switch MenuIndex {
        case 0:
            dest.resNameLabel?.text = "\(MenuIndex)"
        case 1:
            dest.resNameLabel?.text = "\(MenuIndex)"
        case 2:
            dest.resNameLabel?.text = "\(MenuIndex)"
        default:
            break
        }
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "LToMSegue",
            let dest = segue.destination as? RestaurantMenuViewController
        {
            dest.resNameLabel?.text = "click"
        }
    }

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
