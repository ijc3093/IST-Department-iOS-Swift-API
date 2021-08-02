//
//  serviceAbout.swift
//  ISTDepartmentPrinting
//
//  Created by Ike Chukz on 8/2/21.
//

import Foundation

class ServiceAbout{
    
    //Learning part 1 on Youtube about (API call & JSON parsing in Swift (printing in console)): https://www.youtube.com/watch?v=ql82x4Uf5_4&t=298s
    
    
    struct Returned: Decodable{
        //var degreeName: String
        //var about: [About]
        var title: String?
        var description: String?
        var quote: String?
        var quoteAuthor: String?
    }
    
    
    //Get all data from https://www.tvmaze.com/api online
    
    //var urlString = "http://ist.rit.edu/api/courses/"
    var urlString = "http://ist.rit.edu/api/about/"
    //var aboutArray: [Returned]
    
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
                
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                //self.showArray = returned
                print("Herb is what we returned \(returned)")
                
//                self.aboutArray = try JSONDecoder().decode([Returned].self, from: data!)
//                print("Herb is what we returned \(self.aboutArray)")
            }catch{
                print(" JOSN ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
