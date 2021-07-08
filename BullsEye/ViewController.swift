//
//  ViewController.swift
//  BullsEye
//
//  Created by Hussein Dimessi on 8/7/2021.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondaryButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        secondaryButton.setTitle("Open RGBullsEye", for: .normal)
        secondaryButton.setTitleColor(.red, for: .normal)
        view.addSubview(secondaryButton)
        secondaryButton.addTarget(self, action: #selector(presentRGBullsEye), for: .touchUpInside)
    }

    @IBSegueAction func openRGBullsEye(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView())
    }
    
    @objc func presentRGBullsEye() {
        let swiftUIController = UIHostingController(rootView: ContentView())
        self.present(swiftUIController, animated: true, completion: nil)
    }
    
}

