//
//  ViewController.swift
//  WibmoPay
//
//  Created by Hemavathi on 09/07/18 on 07/09/2018.
//  Copyright (c) 2018 Hemavathi. All rights reserved.
//

import UIKit
import WibmoPay

struct MerchantDetails: MerchantTxnProtocol {
    
    var merchantName: String
    
    var merchantKey: String
    
    var merchantCallbackUrl: String
    
    var merchantTxnAmount: String
    
    var merchantMessage: String
    
    var merchantTxnId: String
    
    var merchantPaymentOption: String
    
    var payerName: String
    
    var payerMobile: String
    
    var payerEmailId: String
    
    var buildEnv: BuildEnvironment
    
}

class ViewController: UIViewController {
    @IBAction func WibmoPayBtn() {
        print("getSystemTimeInMills\(getSystemTimeInMills())")
        let merchantTxnId : String = "MPSD\(getSystemTimeInMills())SD"
        let merchantDetails = MerchantDetails(merchantName: "test-shobhit", merchantKey: "1f5abc6e46114094b7abdbbee19a5cb9", merchantCallbackUrl: "https://testpgupi.mypoolin.com/callback", merchantTxnAmount: "1", merchantMessage: "Test", merchantTxnId: merchantTxnId, merchantPaymentOption: "paytm,mobikwik,upi,cards", payerName: "Mypoolin", payerMobile: "9980438393", payerEmailId: "test@mypoolin.com", buildEnv:.staging)
        WibmoPaySdk.sdkManager.merchantDetails = merchantDetails
        WibmoPaySdk.sdkManager.performTransactionFor(fromController: self) { (response, error) in
            if let result = response {
                print("Response:\(result)")
                print("status: \(result.status)")
                print("amount: \(String(describing: result.amount))")
                print("payment_mode :\(String(describing: result.payment_mode))")
                print("order_id: \(result.order_id)")
                print("merchant_name: \(result.merchant_name)")
                print("merchant_txn_id: \(result.merchant_txn_id)")
                print("commission: \(String(describing: result.commission))")
            } else if let error = error {
                print("Error from wibmoPay SDK\(error.localizedDescription)")
            }
        }
    }
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getSystemTimeInMills()->Int64 {
        return  Int64(NSDate().timeIntervalSince1970 * 1000)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


