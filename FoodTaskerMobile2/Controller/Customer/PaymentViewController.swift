//
//  PaymentViewController.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 14/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import Stripe

class PaymentViewController: UIViewController {

    @IBOutlet weak var cardTextField: STPPaymentCardTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func placeOrder(_ sender: Any) {
        APIManager.shared.getLatestOrder { (json) in
            //if json["order"]["status"] != nil && json["order"]["status"] != "Delivered"
            print(json)
            if(json["order"]["status"] != "Cooking" && json["order"]["status"] != "Ready" && json["order"]["status"] != "On the way" && json["order"]["status"] != "Delivered"){
                // Processing the payment and create an Order
                
                  let card = self.cardTextField.cardParams
//                print(card)
                  let card2 = STPCardParams()
                  print(card2)
                  card2.number = card.number
                card2.expMonth = card.expMonth as! UInt
                card2.expYear = card.expYear as! UInt
                card2.cvc = card.cvc
//                let cardParams = STPCardParams()
//                cardParams.number = "4242424242424242"
//                cardParams.expMonth = 10
//                cardParams.expYear = 2021
//                cardParams.cvc = "123"
                STPAPIClient.shared().createToken(withCard: card2, completion: { (token, error) in
                    
                    if let myError = error {
                        print("Error:", myError)
                    } else if let stripeToken = token {
                        
                        APIManager.shared.createOrder(stripeToken: stripeToken.tokenId) { (json) in
                            Tray.currentTray.reset()
                            self.performSegue(withIdentifier: "ViewOrder", sender: self)
                        }
                    }
                })
            
            } else {
                // Showing an alert message.
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel)
                let okAction = UIAlertAction(title: "Go to order", style: .default, handler: { (action) in
                    self.performSegue(withIdentifier: "ViewOrder", sender: self)
                })
                
                let alertView = UIAlertController(title: "Already Order?", message: "Your current order isn't completed", preferredStyle: .alert)
                
                alertView.addAction(okAction)
                alertView.addAction(cancelAction)
                
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
}
