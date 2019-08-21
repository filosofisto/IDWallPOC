//
//  Helper.swift
//  IDWallPOC
//
//  Created by Eduardo Ribeiro da Silva on 21/08/19.
//  Copyright © 2019 Eduardo Ribeiro da Silva. All rights reserved.
//

import Foundation
import UIKit

// with this extension you can do => throw "My Message Error"
extension String: Error { }

extension String: LocalizedError {
    
    public var errorDescription: String? {
        return self
    }
}

class Helper {
  
    static func alert(_ message: String, controller: UIViewController) {
        let alertController = UIAlertController(title: "IDWallPOC", message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
}


