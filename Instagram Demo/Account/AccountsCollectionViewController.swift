//
//  AccountsCollectionViewController.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/18.
//

import UIKit
import Foundation

private let reuseIdentifier = "\(AccountsCollectionViewCell.self)"

class AccountsCollectionViewController: UICollectionViewController {
    let posts = Posts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resize()
    }
    
    func resize() {
        let layout = UICollectionViewFlowLayout()
        let side = (view.bounds.width-2)/3 //cell 邊長
        layout.itemSize = CGSize(width: side, height: side)
        layout.minimumLineSpacing = 1 //行與行的間隙
        layout.minimumInteritemSpacing = 1 //cell&cell 的間隙
        collectionView.collectionViewLayout = layout as UICollectionViewLayout
    }
    
    func catchPhoto(urlString: String, completion: @escaping (Data)->()) {
        guard let itemPic = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: itemPic) { data, response, error in
            if let data = data {
                completion(data)
            }
        }.resume()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      // print("section")
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
       //print("items")
        return posts.postData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("start")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AccountsCollectionViewCell else {return UICollectionViewCell()}
        if let url = posts.postData[indexPath.item].display_url {
                self.catchPhoto(urlString: "\(url)") { data in
                    DispatchQueue.main.async {
                        cell.photoImageView.image = UIImage(data: data)
                    }
                }
            }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(AccountsCollectionReusableView.self)", for: indexPath) as? AccountsCollectionReusableView else {return UICollectionReusableView()}
        
        view.updateUI()
       
        return view
    }
}

extension AccountsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 300)
    }
}
