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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath)
        return cell
    }
}
