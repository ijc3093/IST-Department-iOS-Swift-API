//
//  Menu2ViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/9/21.
//

import UIKit

class Menu2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    
    private var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Menu"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        tableView.tableFooterView = UIView()

        names.append("People")
        names.append("Degress")
        names.append("Minors")
        names.append("Employment")
        names.append("Research")
        names.append("Resources")
        names.append("Courses")
        names.append("People")
        names.append("People")
        names.append("People")
        names.append("People")
    }
    
    
    
    //To Login local
    @IBAction func logout(_ sender: UIButton) {
        let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "segunLogin") as? LoginViewController
        self.view.window?.rootViewController = tabbar
        self.view.window?.makeKeyAndVisible()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return names.count
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

        cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        switch names[indexPath.row] {
        
        case "People":
            let peopleVC = PeopleViewController()
            navigationController?.pushViewController(peopleVC, animated: true)
            
        default:
            break
        }
    }

}
