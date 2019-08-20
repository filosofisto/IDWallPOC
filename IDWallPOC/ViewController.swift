//
//  ViewController.swift
//  IDWallPOC
//
//  Created by Eduardo Ribeiro da Silva on 19/08/19.
//  Copyright © 2019 Eduardo Ribeiro da Silva. All rights reserved.
//

import UIKit
import IDwallToolkit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        idwallInitialize()
    }
    
    private func idwallInitialize() {
        IDwallToolkitSettings.sharedInstance().initWithAuthKey(("23ba2b9963f6e5f5e97229f1a16ccc5e"))
        //IDwallToolkitSettings.sharedInstance().setColorScheme(id<IDwallColorScheme>)
        
        IDwallToolkitFlow.sharedInstance().startComplete(with:
            IDwallDocumentTypeAny, andCallBack: { (data, error) in
                if let validError = error {
                    print(validError)
                } else if let validData = data {
                    print(validData["token"] as! String)
                }
        })
    }

    @IBAction func startFlowAction(_ sender: UIButton) {
        
    }
    
}

