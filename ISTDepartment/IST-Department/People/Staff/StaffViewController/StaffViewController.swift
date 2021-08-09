//
//  StaffViewController.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/7/21.
//

import UIKit

class StaffViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var titleLab: UILabel!
    @IBOutlet var subTitleLab: UILabel!
    @IBOutlet var collectionV: UICollectionView!
    
    var window: UIWindow?
    
    var facu = servicePeople()
    
    //var fac = [Staff]()
    //OR
    var fac: [Staff] = [Staff]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionV.delegate = self
        collectionV.dataSource = self
        
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
        collectionV.register(UINib(nibName: "FacultyCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "FacultyCollectionViewCell")
        facu.getData{
            DispatchQueue.main.async {
                self.titleLab.text = self.facu.peopleArray?.title
                self.subTitleLab.text = self.facu.peopleArray?.subTitle
                self.fac = self.facu.peopleArray.staff
                self.collectionV.reloadData()
            }
        }
    }



    func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fac.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacultyCollectionViewCell", for: indexPath) as! PeopleCollectionViewCell

        //name
        cell.nameLabel.text = fac[indexPath.row].name!
        cell.nameLabel.textColor = .white
        
        //image
        if let url = NSURL(string: fac[indexPath.row].imagePath!) {
            if let data =  NSData(contentsOf: url as URL) {
                cell.imageView.image = UIImage(data: data as Data)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "staff") as? StaffDetailViewController

        detailVC!.fa = facu.peopleArray.staff[indexPath.row]
        print(detailVC!)
        
        //Please do not delete this. This is for your future help.
        //show navigation
        //self.navigationController?.pushViewController(detailVC!, animated: true)
        
        //modal present navigation
        //present(detailVC!, animated: true, completion: nil)
        
        //popover
        detailVC!.modalPresentationStyle = .popover
        self.present(detailVC!, animated: true)
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       // let detailVC = self.storyboard?.instantiateViewController(identifier: "storyboard") as! DetailViewController
//
//
//        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "storyboard") as? DetailViewController
//
//        detailVC!.fa = facu.facultyArray.faculty[indexPath.row]
//        print(detailVC!)
//        self.navigationController?.pushViewController(detailVC!, animated: true)
//
//        self.view.window?.rootViewController = detailVC!
//        self.view.window?.makeKeyAndVisible()
//
//    }

}








////
////  PeopleViewController.swift
////  IST-Department
////
////  Created by Ike Chukz on 8/7/21.
////
//
//import UIKit
//
//class PeopleViewController: UIViewController {
//    
//
//    let facultyVC = PeopleViewController()
//    let staffVC = StaffViewController()
//    let fa = FacultyDetailViewController()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setup()
//    }
//    
//    private func setup(){
//      
//        //Faculty
//        addChild(facultyVC)
//        self.view.addSubview(facultyVC.view)
//        facultyVC.didMove(toParent: self)
//        facultyVC.view.frame = self.view.bounds
//    }
//    
//    @IBAction func segmentControl(_ sender: UISegmentedControl) {
//        
//        if sender.selectedSegmentIndex == 0 {
//            //Faculty
//            addChild(facultyVC)
//            self.view.addSubview(facultyVC.view)
//            facultyVC.didMove(toParent: self)
//            facultyVC.view.frame = self.view.bounds
//            
//            
//        }else if sender.selectedSegmentIndex == 1 {
//            // Staff
//            addChild(staffVC)
//            self.view.addSubview(staffVC.view)
//            staffVC.didMove(toParent: self)
//            staffVC.view.frame = self.view.bounds
//            
//        }
//    }
//    
//    
//    
//}
