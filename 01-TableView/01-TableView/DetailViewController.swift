//
//  DetailViewController.swift
//  01-TableView
//
//  Created by Antonio Sejas on 16/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    var name = "Sejas"
    var subtitle = "iOS Instructor"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblName.text = self.name
        self.lblSubtitle.text = self.subtitle
    }

}
