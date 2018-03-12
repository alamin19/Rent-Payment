//
//  HomeVC.swift
//  Rent Payment
//
//  Created by Saddam Al Amin on 2/28/18.
//  Copyright © 2018 Saddam Al Amin. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // MARK:- ViewController Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Action Methods -
    
    @IBAction func btnPaymentClicked(_ sender: UIButton) {
        
        self.tabBarController?.selectedIndex = 1
    }
    
    
    @IBAction func btnEnquiryClicked(_ sender: UIButton) {
        
        self.tabBarController?.selectedIndex = 2
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
