//
//  MenuViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/8/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var degrees = "Degrees"
    var minors = "Minors"
    var employment = "Employment"
    var people = "People"
    var research = "Research"
    var resources = "Resources"
    var courses = "courses"
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Menu"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .brown
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        //setupView()
    }

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        view.addSubview(cellView)
    }
    
    
    //To Login local
    @IBAction func logout(_ sender: UIButton) {
        let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "segunLogin") as? LoginViewController
        self.view.window?.rootViewController = tabbar
        self.view.window?.makeKeyAndVisible()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return degrees.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        // Configure the cell...
        if(indexPath.row == 0){
            cell.titleLabel.text = people
        }else if(indexPath.row == 1){
            cell.titleLabel.text = minors
        }else if(indexPath.row == 2){
            cell.titleLabel.text = employment
        }else if(indexPath.row == 3){
            cell.titleLabel.text = degrees
        }else if(indexPath.row == 4){
            cell.titleLabel.text = research
        }else if(indexPath.row == 5){
            cell.titleLabel.text = resources
        }else if(indexPath.row == 6){
            cell.titleLabel.text = courses
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 60
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(#function)
        dismiss(animated: true, completion: nil)
    }
}
