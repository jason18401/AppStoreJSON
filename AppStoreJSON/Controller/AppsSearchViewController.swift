//
//  AppsSearchViewController.swift
//  AppStoreJSON
//
//  Created by Jason Yu on 8/26/19.
//  Copyright © 2019 Jason Yu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellReuseId = "searchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
        
        fetchITunesApps()
    }
    
    //moved to model
//    struct SearchResult: Decodable{
//        let resultCount: Int
//        let results: [Result]
//    }
//
//    struct Result: Decodable {
//        let trackName: String
//        let primaryGenreName: String
//    }
    
    fileprivate func fetchITunesApps(){
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                print("Failed to fetch apps:", error)
                return
            }else{
                
                //on success
                guard let data = data else {return}
                
                do{
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    print(searchResult)
                    
                    searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                }catch{
                    print("Failed to decode json:", error)
                    return
                }
            }
            
        }.resume()  //fires off the request
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! SearchResultCollectionViewCell
        cell.nameLabel.text = "YEA"
        return cell
    }
}
