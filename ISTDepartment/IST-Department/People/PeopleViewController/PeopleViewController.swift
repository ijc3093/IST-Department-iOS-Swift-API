//
//  FacultyViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/5/21.
//

import UIKit

class PeopleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var titleLab: UILabel!
    @IBOutlet var subTitleLab: UILabel!
    @IBOutlet var collectionV: UICollectionView!
    
    var facu = servicePeople()
    
    //var fac = [Faculty]()
    //var sta = [Staff]()
    //OR
    var fac: [Faculty] = [Faculty]()
    var sta: [Staff] = [Staff]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionV.delegate = self
        collectionV.dataSource = self
        
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
        collectionV.register(UINib(nibName: "PeopleCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PeopleCollectionViewCell")
        facu.getData{
            DispatchQueue.main.async {
                self.titleLab.text = self.facu.peopleArray?.title
                self.subTitleLab.text = self.facu.peopleArray?.subTitle
                self.fac = self.facu.peopleArray.faculty
                self.sta = self.facu.peopleArray.staff
                self.collectionV.reloadData()
            }
        }
    }

    //Segmented Control
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        collectionV.reloadData()
    }
        
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        collectionV.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        //return fac.count
        
        var returnValue = 0
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            returnValue = fac.count
            break
        case 1:
            returnValue = sta.count
            break
        default:
            break
        }
        return returnValue
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleCollectionViewCell", for: indexPath) as! PeopleCollectionViewCell

        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            //name
            cell.nameLabel.text = fac[indexPath.row].name!
            cell.nameLabel.textColor = .white
            
            //image
            if let url = NSURL(string: fac[indexPath.row].imagePath!) {
                if let data =  NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
            }
            break
            
        case 1:
            //name
            cell.nameLabel.text = sta[indexPath.row].name!
            cell.nameLabel.textColor = .white
            
            //image
            if let url = NSURL(string: sta[indexPath.row].imagePath!) {
                if let data =  NSData(contentsOf: url as URL) {
                    cell.imageView.image = UIImage(data: data as Data)
                }
            }
            break
            
        default:
            break
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailVC = self.storyboard?.instantiateViewController(identifier: "faculty") as? PeopleDetailViewController
//
//        detailVC!.fa = facu.peopleArray.faculty[indexPath.row]
//        print(detailVC!)
//
//        //Please do not delete this. This is for your future help.
//        //show navigation
//        //self.navigationController?.pushViewController(detailVC!, animated: true)
//
//        //modal present navigation
//        //present(detailVC!, animated: true, completion: nil)
//
//        //popover
//        detailVC!.modalPresentationStyle = .popover
//        self.present(detailVC!, animated: true)
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "peopleDetail") as? PeopleDetailViewController
        let detailVC = PeopleDetailViewController()
        if(segmentedControl.selectedSegmentIndex == 0){
            
            
            detailVC.fa = facu.peopleArray.faculty[indexPath.row]
            print(detailVC)

            //popover
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        else if(segmentedControl.selectedSegmentIndex == 1){
            detailVC.staf = facu.peopleArray.staff[indexPath.row]
            print(detailVC)

            //popover
            detailVC.modalPresentationStyle = .popover
            self.present(detailVC, animated: true)
        }
        
    }

}
