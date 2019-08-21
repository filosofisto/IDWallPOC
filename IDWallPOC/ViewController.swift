//
//  ViewController.swift
//  IDWallPOC
//
//  Created by Eduardo Ribeiro da Silva on 19/08/19.
//  Copyright © 2019 Eduardo Ribeiro da Silva. All rights reserved.
//

import UIKit
import IDwallToolkit
import AVKit

class ViewController: UIViewController, IDWallCall {
    
    let idwall = IDWall(authKey: "23ba2b9963f6e5f5e97229f1a16ccc5e")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idwall.delegate = self
    }
    
    // MARK: IDWallCall --------------------------------------------------
    func onError(_ error: Error) {
        Helper.alert(error.localizedDescription, controller: self)
    }
    
    func onSuccessFaceFlow() {
        Helper.alert("FaceFlow worked fine ;)", controller: self)
    }
    
    func onSuccessDocumentFlow(token: String) {
        Helper.alert("Token recebido: \(token)", controller: self)
    }
    
    func onSuccessCompleteFlow(token: String) {
        Helper.alert("Token recebido: \(token)", controller: self)
    }
    // -------------------------------------------------------------------

    @IBAction func faceFlowAction(_ sender: UIButton) {
        idwall.startFaceFlow()
    }
    
    @IBAction func documentFlowAction(_ sender: UIButton) {
        idwall.startDocumentFlow()
    }
    
    
    @IBAction func completeFlowAction(_ sender: UIButton) {
        idwall.startCompleteFlow()
    }
}

