//
//  FlightsListViewController.swift
//  MyFlights
//
//  Created by Nicolas Frugoni on 08/07/2021.
//

import UIKit

class FlightsListViewController: UIViewController {
    private var onLoad: (() -> Void)? = nil
    
    convenience init(onLoad: @escaping () -> Void) {
        self.init()
        self.onLoad = onLoad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onLoad?()
    }
    
}
