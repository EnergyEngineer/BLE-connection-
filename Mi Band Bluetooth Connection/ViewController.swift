//
//  ViewController.swift
//  Mi Band Bluetooth Connection
//
//  Created by TOGNI Elie on 06/08/2018.
//  Copyright © 2018 TOGNI Elie. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    
    var manager: CBCentralManager!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        print("Peripheral : \(peripheral)")
    }
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        var consoleMsg = ""
        
        switch (central.state) {
        case .poweredOff:
            consoleMsg = "BLE is powered off"
        case .poweredOn:
            consoleMsg = "BLE is powered on"
            manager.scanForPeripherals(withServices: nil, options: nil)
        case .resetting:
            consoleMsg = "BLE is resetting"
        case .unauthorized:
            consoleMsg = "BLE is unauthorized"
        case .unknown:
            consoleMsg = "BLE is unknown"
        case .unsupported:
            consoleMsg = "BLE is unsupported"
      
        }
        
        print("\(consoleMsg)")
        
        
        
    }
 


}

