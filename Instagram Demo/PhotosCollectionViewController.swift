//
//  PhotosCollectionViewController.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/17.
//

import UIKit
class PhotosCollectionViewController: UICollectionViewController {
    
    static let reuseIdentifier = "\(PhotosCellectionViewCell.self)"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewController.reuseIdentifier, for: indexPath) as! PhotosCellectionViewCell
        let layoutFlow = collectionViewLayout as! UICollectionViewFlowLayout
        let side = view.bounds.width/3
        layoutFlow.estimatedItemSize = .zero
        layoutFlow.itemSize = CGSize(width: side, height: side)
        layoutFlow.minimumInteritemSpacing = 1
        
        do {
            cell.imageView.image = try UIImage(data: Data(contentsOf: data[indexPath.item].edge_owner_to_timeline_media.edges[0].node[0].display_url!))
        } catch {fatalError()}
        
        
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
}
