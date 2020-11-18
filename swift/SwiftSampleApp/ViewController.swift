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
        
        let randomNumber = Int.random(in: 1...5)
        
        let localizedStringWithFormat1 = String.localizedStringWithFormat(localizedMinutes, 1)
        
        print("\(localizedStringWithFormat1)")
        
        let text = NSString.localizedStringWithFormat(localizedMinutes as NSString,
                                                    randomNumber)
        
        print("\(text)")
        
        let localizedUnsignedMinutes = "%#@u_unit_time@"
        let localizedStringWithFormat2 = String.localizedStringWithFormat(localizedUnsignedMinutes, UInt(3))
        
        print("\(localizedStringWithFormat2)")
    }
}

