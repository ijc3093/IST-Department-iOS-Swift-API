//
//  AboutViewController.swift
//  ISTDepartmentPrinting
//
//  Created by Ike Chukz on 8/2/21.
//

import UIKit

class AboutViewController: UIViewController {

    var about = ServiceAbout()
    override func viewDidLoad() {
        super.viewDidLoad()

        about.getData{}
    }
}
