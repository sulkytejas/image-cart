//
//  ContactViewController.swift
//  ImageStream
//
//  Created by tejas Pashte on 10/5/16.
//  Copyright © 2016 tejas Pashte. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(contactScrollView)
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        contactScrollView.contentSize = CGSize(width: 375, height: 850)
    }
    

}
