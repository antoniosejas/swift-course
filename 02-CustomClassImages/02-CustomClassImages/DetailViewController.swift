//
//  DetailViewController.swift
//  02-CustomClassImages
//
//  Created by Antonio Sejas on 17/3/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    var name = ""
    var subtitle = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblName.text = self.name
        self.lblSubtitle.text = self.subtitle
        self.lblEmail.text = self.email
    }

}
