//
//  AccountsTableViewController.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/17.
//

import UIKit
import Foundation

class AccountsTableViewController: UITableViewController, UINavigationControllerDelegate {
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet var accountsTableView: UITableView!
    
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var idImageView: UIImageView!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    var url: URL?
    
    let reuseIdentifier = "\(PhotosCellectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoResize()
        updateUI()
        idImageView.layer.cornerRadius = idImageView.bounds.width/2
        idImageView.layer.borderWidth = 5
        idImageView.layer.borderColor = CGColor(red: 1, green: 0, blue: 0.4, alpha: 0.6)
    
    }
    
    func updateUI() {
        if let imageURL = URL(string: "https://instagram.ftpe12-2.fna.fbcdn.net/v/t51.2885-19/75272186_849728705447448_1957039476630880256_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.ftpe12-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=66AYAm3nJwYAX-JHef6&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-LmJPKSiHRu9Ws2T6m-uPKXQUcoWRpbEYjyqyT1A5tIQ&oe=628A4D03&_nc_sid=7bff83") {
            do {
                idImageView.image = try UIImage(data: Data(contentsOf: imageURL))
            }
            catch {
                fatalError()
            }
            
        }
        postCountLabel.text = "1241\nPosts"
        followingLabel.text = "4035\nFollowing"
        followersLabel.text = "12.1 K\nFollowers"
        bioLabel.text = "🐶 We ❤️ Dachshund!!\n👇 Need Feature? on our page? DM us!!\n🛒 Shop Cute Dachshund Items 👇"
       
        fullNameLabel.text = "Dachshund Lovers 🐾"
        linkButton.configuration?.title = "https://teespece.com/dachshund-shirts-collection"
    }
    
    
    @IBAction func changeTheme(_ sender: Any) {
        photosCollectionView.reloadData()
    }
    
    func catchPhoto(url: String, completion:@escaping (Data)->()) {
        guard let itemPic = URL(string: url) else {return}
        URLSession.shared.dataTask(with: itemPic) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }.resume()
    }
    
    func autoResize() {
        accountsTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        accountsTableView.estimatedRowHeight = 300
        accountsTableView.rowHeight = UITableView.automaticDimension
        
        let layoutFlow = UICollectionViewFlowLayout()
        let side = (view.bounds.width-2)/3
        layoutFlow.estimatedItemSize = .zero
        layoutFlow.itemSize = CGSize(width: side, height: side)
        layoutFlow.minimumInteritemSpacing = 1
        layoutFlow.minimumLineSpacing = 1
        photosCollectionView.collectionViewLayout = layoutFlow as UICollectionViewLayout
    }

    // MARK: - Table view data source

}


extension AccountsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource{
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCellectionViewCell
         
         if themeSegmentedControl.selectedSegmentIndex == 0 {
             if let picUrl = data[indexPath.item].edge_owner_to_timeline_media.edges[0].node[0].display_url {
                 catchPhoto(url: "\(picUrl)") { data in
                     DispatchQueue.main.async {
                         if indexPath == collectionView.indexPath(for: cell) {
                             cell.imageView.image = UIImage(data: data)
                         }
                     }
                 }
             }
         } else if themeSegmentedControl.selectedSegmentIndex == 1 {
             if let picUrl = data[indexPath.item].edge_felix_video_timeline.edges[0].node.display_url {
                 catchPhoto(url: "\(picUrl)") { data in
                     DispatchQueue.main.async {
                         if indexPath == collectionView.indexPath(for: cell) {
                             cell.imageView.image = UIImage(data: data)
                         }
                     }
                 }
             }
         }
         
         
         return cell
    }

}
