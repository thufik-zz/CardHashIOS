//
//  ViewController.swift
//  CardHash
//
//  Created by Fellipe Thufik Costa Gomes Hoashi on 14/12/16.
//  Copyright © 2016 Fellipe Thufik Costa Gomes Hoashi. All rights reserved.
//

import UIKit
import PagarMe

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func generateCardHash(_ sender: UIButton) {
    
        PagarMe.sharedInstance().encryptionKey = "ek_test_D8fnTNOqaPBQx46QBiDprUzeophI7q"
        let creditCard = PagarMeCreditCard(cardNumber: "4111111111111111", cardHolderName: "Test Card", cardExpirationMonth: "10", cardExpirationYear: "20", cardCvv: "123")
        
        print(creditCard!)
        
        if (creditCard?.hasErrorCardCVV())!{
            print("erro no CVV")
        }else if (creditCard?.hasErrorCardNumber())!{
            print("Erro no numero do cartão")
        }else if (creditCard?.hasErrorCardHolderName())!{
            print("Erro no nome do cartão")
        }else if (creditCard?.hasErrorCardExpirationYear())!{
            print("Erro no ano de expiração")
        }else if (creditCard?.hasErrorCardExpirationMonth())!{
            print("Erro no mês de expiração")
        }else{
            creditCard?.generateHash({ (error, cardHash) -> Void in
                if (error != nil) {
                    print("erro = \(error.debugDescription)")
                }
                else
                {
                    print(cardHash!)
                }
            })
        }
    }

}

