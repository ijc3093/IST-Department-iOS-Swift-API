//
//  DegreesDetailViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/12/21.
//

import UIKit

class DegreesDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var underg: Undergraduate!
    var gra: Graduate!
    var mode = DegreesViewController()
    var modeImage = ""
    var modeImage2 = ""
    
    var url = ""
    var url2 = ""
    
    @IBOutlet var tableView: UITableView!
    var identity = "DetailTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: identity, bundle: nil), forCellReuseIdentifier: identity)
        
        
        if(underg != nil){
            
            guard underg != nil else{
                print("!!! show it nil in DetailViewController should NEVER happen!")
                return
            }
        }else if(gra != nil){
            
            guard gra != nil else{
                print("!!! show it nil in DetailViewController should NEVER happen!")
                return
            }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath) as! DetailTableViewCell
        
            // UNDERGRADUATE
            if(underg != nil) {
                cell.labelTitle.text = underg.title
                cell.descriptionLabel.text = underg.description
                cell.concentrationText.text = "Concentrations"
                cell.imageV.image = UIImage(named: modeImage)
                
                //String changes to [] for concentrations
                var concentrationsList = ""
                if underg.concentrations != nil{
                    for conc in underg.concentrations! {
                        concentrationsList += "\(conc)"
                    }
                    if concentrationsList != "" {
                        concentrationsList.removeLast()
                    }
                }
                cell.concentrationsLabel.text = concentrationsList
                cell.degreesName.text = underg.degreeName
                cell.url.text = url
                
            // GRADUATE
            }else if(gra != nil) {
                cell.labelTitle.text = gra.title
                cell.descriptionLabel.text = gra.description
                cell.concentrationText.text = "Concentrations"
                cell.imageV.image = UIImage(named: modeImage2)
                
                //String changes to [] for genre
                var concentrationsList = ""
                if gra.concentrations != nil{
                    for conc in gra.concentrations! {
                        concentrationsList += "\(conc)"
                    }
                    if concentrationsList != "" {
                        concentrationsList.removeLast()
                    }
                }
                cell.concentrationsLabel.text = concentrationsList
                cell.degreesName.text = gra.degreeName
                cell.url.text = url2
            }
            return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 100
//    }
}
