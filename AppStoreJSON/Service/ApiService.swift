//
//  ApiService.swift
//  AppStoreJSON
//
//  Created by Jason Yu on 9/2/19.
//  Copyright © 2019 Jason Yu. All rights reserved.
//

import Foundation

class Service{
    
    static let shared = Service() //singleton
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()){
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print("Failed to fetch apps:", error)
                completion([], error)
                return
            }else{
                
                //on success
                guard let data = data else {return}
                
                do{
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    
                    completion(searchResult.results, nil)    //nil because this is the success case
                    
//                    self.appResults = searchResult.results
//
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()    //not always guarenteed to have all of the results when starting the app
//                    }
//
//                    print(searchResult)
//                    searchResult.results.forEach({print($0.trackName, $0.primaryGenreName, $0.userRatingCount ?? 0)})
                    
                }catch{
                    print("Failed to decode json:", error)
                    completion([], error)
                    return
                }
            }
        }.resume()  //fires off the request

    }
}
