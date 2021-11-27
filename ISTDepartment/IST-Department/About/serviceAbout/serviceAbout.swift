//
//  Faculty.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/4/21.
//

import Foundation

class serviceAbout{

    var urlString = "http://ist.rit.edu/api/about/"
    var aboutArray: Returned!
    
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
                self.aboutArray = try JSONDecoder().decode(Returned.self, from: data!)
                print("Here is what we returned \(String(describing: self.aboutArray))")
            }catch{
                print(" JOSN ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
