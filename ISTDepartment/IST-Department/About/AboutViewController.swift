//
//  AboutViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/4/21.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var quoteAuthorLabel: UILabel!
    
    var about = serviceAbout()
    override func viewDidLoad() {
        view.backgroundColor = .orange
        super.viewDidLoad()
        about.getData{
            DispatchQueue.main.async {
                
                self.titleLabel.text = self.about.aboutArray.title
                self.descriptionText.text = self.about.aboutArray.description
                self.descriptionText.backgroundColor = .brown
                self.descriptionText.textColor = .white
                self.quoteLabel.text = self.about.aboutArray.quote
                self.quoteAuthorLabel.text = self.about.aboutArray.quoteAuthor
            }
        }
    }
    
}

