//
//  LoginViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/5/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func login(_ sender: UIButton) {
        
        let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "segunTab") as? UITabBarController
            self.view.window?.rootViewController = tabbar
            self.view.window?.makeKeyAndVisible()
    }
    
}
