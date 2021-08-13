//
//  serviceDegree.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/10/21.
//

import Foundation

class serviceDegree{

    var urlString = "http://ist.rit.edu/api/degrees/"
    var degreeArray: DegreeReturned!
    
    
    func getData(completed: @escaping ()-> ()){
        
        print(" We are accessing the url \(urlString)")
        
        //create a URL
        guard let url = URL(string: urlString) else{
            
            print("ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        //create a URLSession
        let session = URLSession.shared
        
        //get data with .dataTask method
        let task = session.dataTask(with: url){(data, response, error) in
            if let error = error{
                print("ERROR: \(error.localizedDescription)")
            }
            
            //deal with the data
            do{
                self.degreeArray = try JSONDecoder().decode(DegreeReturned.self, from: data!)
                print("Herb is what we returned \(String(describing: self.degreeArray))")
            }catch{
                print(" JOSN ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}

