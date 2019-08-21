//
//  IDWall.swift
//  IDWallPOC
//
//  Created by Eduardo Ribeiro da Silva on 20/08/19.
//  Copyright © 2019 Eduardo Ribeiro da Silva. All rights reserved.
//

import Foundation
import UIKit
import IDwallToolkit
import AVKit

// Errors
enum IDWallError: Error {
    case cameraDenied
    case cameraRestrict
    case unknown
}

// Protocol for callback
protocol IDWallCall {
    
    func onError(_ error: Error)
    
    func onSuccessFaceFlow()
    
    func onSuccessDocumentFlow(token: String)
    
    func onSuccessCompleteFlow(token: String)
}

// Wraps IDWall SDK
class IDWall {
    
    var delegate: IDWallCall?
    
    init(authKey: String) {
        // TODO: Put it in config place
        IDwallToolkitSettings.sharedInstance().initWithAuthKey(authKey)
    }
    
    func startFaceFlow() {
        execFlowWithCameraAuthorization(f: doFaceFlow)
    }
    
    func startDocumentFlow() {
        execFlowWithCameraAuthorization(f: doDocumentFlow)
    }
    
    func startCompleteFlow() {
        execFlowWithCameraAuthorization(f: doCompleteFlow)
    }
    
    private func execFlowWithCameraAuthorization(f: @escaping () -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized: // The user has previously granted access to the camera.
            f()
            
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    f()
                }
            }
            
        case .denied: // The user has previously denied access.
            delegate?.onError(IDWallError.cameraDenied)
            return
            
        case .restricted: // The user can't grant access due to restrictions.
            delegate?.onError(IDWallError.cameraRestrict)
            return
            
        default:
            return
        }
    }
    
    private func doFaceFlow() {
        //IDwallToolkitFlow.sharedInstance().presentTutorial(false)
        //IDwallToolkitSettings.sharedInstance().setColorScheme(id<IDwallColorScheme>)
        
        DispatchQueue.main.async {
            IDwallToolkitFlow.sharedInstance().startFace(callBack: { (data, error) in
                if let validError = error {
                    self.delegate?.onError(validError)
                } else {
                    self.delegate?.onSuccessFaceFlow()
                }
            })
        }
    }
    
    private func doDocumentFlow() {
        IDwallToolkitFlow.sharedInstance().startDocumentFlow(with:
            IDwallDocumentTypeRG, andCallBack: {(data, error) in
                if let validError = error {
                    self.delegate?.onError(validError)
                } else if let validData = data {
                    self.delegate?.onSuccessDocumentFlow(token: validData["token"] as! String)
                }
        })
    }
    
    private func doCompleteFlow() {
        IDwallToolkitFlow.sharedInstance().startComplete(with:
            IDwallDocumentTypeAny, andCallBack: { (data, error) in
                if let validError = error {
                    print(validError)
                } else if let validData = data {
                    self.delegate?.onSuccessCompleteFlow(token: validData["token"] as! String)
                }
        })
    }

}
