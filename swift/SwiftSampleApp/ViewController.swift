//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Stelios Petrakis on 30/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let localizedString = NSLocalizedString("test string", comment: "Test comment")
        
        print("\(#function) -> \(localizedString)")
        
        let localizedMinutes = "%#@d_unit_time@"
        let localizedUnsignedMinutes = "%#@u_unit_time@"
        
        for cnt in 0...10 {
            let text = NSString.localizedStringWithFormat(localizedMinutes as NSString, cnt)
            print("[\(cnt)] -> \(text)")
        }
        
        let utext = String.localizedStringWithFormat(localizedUnsignedMinutes, UInt(2))
        print("[2] -> \(utext)")
        
    }
}

