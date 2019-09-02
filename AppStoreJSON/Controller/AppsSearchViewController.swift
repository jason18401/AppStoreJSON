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
    
    fileprivate var appResults = [Result]()
    
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
        Service.shared.fetchApps { (results, error)  in
            
            if let error = error{
                print("Failed to fetch apps data:", error)
            }else{
                self.appResults = results
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! SearchResultCollectionViewCell
        
        let appResult = appResults[indexPath.item] //collectionViews should use item tableView row
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingsLabel.text = "Result \(appResult.userRatingCount ?? 0)"
        
        
        return cell
    }
}
