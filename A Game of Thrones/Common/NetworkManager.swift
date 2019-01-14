//
//  NetworkManager.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 11/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//


import UIKit

class NetworkManager{
    
    //MARK: Shared Instance
    class var SharedInstance: NetworkManager {
        struct Global {
            static let instance = NetworkManager()
        }
        return Global.instance
    }
    
    
    //MARK: Reachability Check
    func isNetworkReachable() -> Bool {
        
        if Reachability.isConnectedToNetwork() == true {
            return true
        } else {
            return false
        }
        
    }

}



