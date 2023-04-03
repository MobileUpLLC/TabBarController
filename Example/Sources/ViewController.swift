//
//  ViewController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit
import TabBarController

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = TabBarController()
        print(t.text)
        
        view.backgroundColor = .red
    }
}
