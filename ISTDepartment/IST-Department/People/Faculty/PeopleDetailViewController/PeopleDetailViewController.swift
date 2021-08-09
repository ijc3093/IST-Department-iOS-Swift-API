//
//  FacultyDetailViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/7/21.
//

import UIKit

class PeopleDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var officeLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    
    var fa: Faculty!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        guard fa != nil else{
            print("!!! show it nil in DetailViewController should NEVER happen!")
            return
        }
        updateUserInterface()
    }
    
    func updateUserInterface(){
        //String changes to Image for ImageView
        guard let url = URL(string: fa.imagePath ?? "") else{return}
        do{
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        }catch{
            print("ERROR: Could not get image from url \(url)")
        }

        self.nameLabel.text = fa.name
        self.usernameLabel.text = fa.username
        self.titleLabel.text = fa.interestArea
        self.officeLabel.text = fa.office
        self.phoneLabel.text = fa.phone
        self.emailLabel.text = fa.email
    }

}
