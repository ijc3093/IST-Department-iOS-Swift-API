//
//  MenuViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/8/21.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logout(_ sender: UIButton) {
        let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "segunLogin") as? LoginViewController
        self.view.window?.rootViewController = tabbar
        self.view.window?.makeKeyAndVisible()
    }
    
}
