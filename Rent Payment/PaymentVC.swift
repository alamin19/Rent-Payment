//
//  PaymentVC.swift
//  Rent Payment
//
//  Created by Saddam Al Amin on 2/28/18.
//  Copyright © 2018 Saddam Al Amin. All rights reserved.
//

import UIKit
import Braintree
import BraintreeDropIn


class PaymentVC: UIViewController {

    let toKinizationKey = "sandbox_zc9dhwsz_b24zjcxbqz43t67c"
    @IBOutlet weak var txtAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendRequestPaymentToServer(nonce: String, amount: String) {
        let paymentURL = URL(string: "http://localhost/Pay/pay.php")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(nonce)&amount=\(amount)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) -> Void in
            guard let data = data else {
                print(error!.localizedDescription)
                return
            }
            
            guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = result?["success"] as? Bool, success == true else {
                print("Transaction failed. Please try again.")
                return
            }
            
            print("Successfully charged. Thanks So Much :)")
            }.resume()
    }

    @IBAction func btnPaymentClicked(_ sender: UIButton) {
        
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: toKinizationKey, request: request)
        { [unowned self] (controller, result, error) in
            
            print(result!)
            if let error = error {
                print(error.localizedDescription)
                
            } else if (result?.isCancelled == true) {
                print("Transaction Cancelled")
                
            } else if let nonce = result?.paymentMethod?.nonce, let amount = self.txtAmount.text {
                print(nonce)
                self.sendRequestPaymentToServer(nonce: nonce, amount: amount)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
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
