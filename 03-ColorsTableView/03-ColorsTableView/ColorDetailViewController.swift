//
//  ColorDetailViewController.swift
//  03-ColorsTableView
//
//  Created by Antonio Sejas on 18/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    var color = UIColor()
    var stringTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color
        self.lblTitle.text = "\(stringTitle) !"
    }
    
}
