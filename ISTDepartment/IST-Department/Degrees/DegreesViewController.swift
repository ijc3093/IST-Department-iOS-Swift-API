//
//  DegreesViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/10/21.
//

import UIKit

class DegreesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView1: UICollectionView!
    @IBOutlet var undergraduate: UILabel!
    @IBOutlet var collectionView2: UICollectionView!
    @IBOutlet var graduate: UILabel!
    
    var degr = serviceDegree()
    var underg = [Undergraduate]()
    var grad = [Graduate]()
    var Images = ["wmc.png", "hcc.png", "cit.png"]
    var Images2 = ["ist.png", "hci2.png", "nsa.png"]
    
    var url = ["http://wmc.rit.edu", "http://hcc.rit.edu", "http://cit.rit.edu"]
    var url2 = ["http://it.rit.edu", "http://hci.rit.edu", "http://nsa.rit.edu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        undergraduate.text = "UNDERGRADUATE"
        graduate.text = "GRADUATE"
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        //view.backgroundColor = .orange
        collectionView1.register(UINib(nibName: "DegreeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "DegreeCollectionViewCell")
        
        collectionView2.register(UINib(nibName: "DegreeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "DegreeCollectionViewCell")
        // Do any additional setup after loading the view.
        
        degr.getData {
           DispatchQueue.main.async {
            self.collectionView1.reloadData()
            self.collectionView2.reloadData()
            
            //underg
            self.underg = self.degr.degreeArray.undergraduate
            
            //grad
            self.grad = self.degr.degreeArray.graduate
           }
       }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //underg
        if collectionView == collectionView {
            return underg.count
        }
        //grad
        else if collectionView == collectionView2{
            return grad.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DegreeCollectionViewCell", for: indexPath) as! DegreeCollectionViewCell
        //underg
        if collectionView == collectionView1 {
            cell.degreeName.text = underg[indexPath.row].degreeName
            cell.imageV.image = UIImage(named: Images[indexPath.row])
            cell.degreeName.textColor = .white
            
        //grad
        }else if collectionView == collectionView2{
            cell.degreeName.text = grad[indexPath.row].degreeName
            cell.imageV.image = UIImage(named: Images2[indexPath.row])
            cell.degreeName.textColor = .white
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "peopleDetail") as? PeopleDetailViewController
        let degreeVC = DegreesDetailViewController()
        if collectionView == collectionView1 {
            degreeVC.underg = degr.degreeArray.undergraduate[indexPath.row]
            print(degreeVC)
            
            //This data is not from url. So I added this data
            if(collectionView == collectionView1){
                degreeVC.modeImage = Images[indexPath.row]
                
                if(indexPath.row == 0){
                    degreeVC.url = url[indexPath.row]
                }else if(indexPath.row == 1){
                    degreeVC.url = url[indexPath.row]
                }else if(indexPath.row == 2){
                    degreeVC.url = url[indexPath.row]
                }
            }
            
            //popover
            self.navigationController?.pushViewController(degreeVC, animated: true)
        }else if collectionView == collectionView2 {
            degreeVC.gra = degr.degreeArray.graduate[indexPath.row]
            print(degreeVC)

            //This data is not from url. So I added this data
            if(collectionView == collectionView2){
                degreeVC.modeImage2 = Images2[indexPath.row]
                
                if(indexPath.row == 0){
                    degreeVC.url2 = url2[indexPath.row]
                }else if(indexPath.row == 1){
                    degreeVC.url2 = url2[indexPath.row]
                }else if(indexPath.row == 2){
                    degreeVC.url2 = url2[indexPath.row]
                }
            }
            
            //popover
            self.navigationController?.pushViewController(degreeVC, animated: true)
        }
    }
}
