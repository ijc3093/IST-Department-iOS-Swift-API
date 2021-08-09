//
//  PeopleDetailViewController.swift
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
    
    var staf: Staff!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        if(fa != nil){
            
            guard fa != nil else{
                print("!!! show it nil in DetailViewController should NEVER happen!")
                return
            }
        }else if(staf != nil){
            
            guard staf != nil else{
                print("!!! show it nil in DetailViewController should NEVER happen!")
                return
            }
        }
        updateUserInterface()
    }
    
    func updateUserInterface(){
        
        if (fa != nil) {
           
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
            
        } else if(staf != nil){
            //String changes to Image for ImageView
            guard let url = URL(string: staf.imagePath ?? "") else{return}
            do{
                let data = try Data(contentsOf: url)
                imageView.image = UIImage(data: data)
            }catch{
                print("ERROR: Could not get image from url \(url)")
            }

            self.nameLabel.text = staf.name
            self.usernameLabel.text = staf.username
            self.titleLabel.text = staf.interestArea
            self.officeLabel.text = staf.office
            self.phoneLabel.text = staf.phone
            self.emailLabel.text = staf.email
        }
    }

}
