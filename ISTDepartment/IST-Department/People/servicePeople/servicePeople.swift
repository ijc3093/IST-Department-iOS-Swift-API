//
//  serviceFaculty.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/5/21.
//

import Foundation

class servicePeople{

    var urlString = "http://ist.rit.edu/api/people/"
    var peopleArray: PeopleReturned!
    
    
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
                self.peopleArray = try JSONDecoder().decode(PeopleReturned.self, from: data!)
                print("Herb is what we returned \(String(describing: self.peopleArray))")
            }catch{
                print(" JOSN ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
