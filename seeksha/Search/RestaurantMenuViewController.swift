//
//  RestaurantMenuViewController.swift
//  seeksha
//
//  Created by moblie on 28/11/2018.
//  Copyright © 2018 lbh. All rights reserved.
//

import UIKit

var selected : String = ""

protocol sendBackDelegate {
    func dataReceived(data: String)
}

class RestaurantMenuViewController: UIViewController {


    @IBOutlet weak var resNameLabel: UILabel!
    
    var resName = ""
    var delegate : sendBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resNameLabel?.text = selected
        
      

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnView(_ sender: Any){
        
        dismiss(animated: true, completion: nil)
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
