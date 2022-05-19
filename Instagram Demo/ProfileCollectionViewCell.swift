//
//  ProfileCollectionViewCell.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/18.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var postCountsLabel: UILabel!
    
    
    func updateUI() {
        func updateUI() {
            if let imageURL = URL(string: "https://instagram.ftpe12-2.fna.fbcdn.net/v/t51.2885-19/75272186_849728705447448_1957039476630880256_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.ftpe12-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=66AYAm3nJwYAX-JHef6&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-LmJPKSiHRu9Ws2T6m-uPKXQUcoWRpbEYjyqyT1A5tIQ&oe=628A4D03&_nc_sid=7bff83") {
                do {
                    headImageView.image = try UIImage(data: Data(contentsOf: imageURL))
                }
                catch {
                    fatalError()
                }
                
            }
            postCountsLabel.text = "1241\nPosts"
            followingLabel.text = "4035\nFollowing"
            followersLabel.text = "12.1 K\nFollowers"
            bioLabel.text = "🐶 We ❤️ Dachshund!!\n👇 Need Feature? on our page? DM us!!\n🛒 Shop Cute Dachshund Items 👇"
           
            fullNameLabel.text = "Dachshund Lovers 🐾"
            linkButton.configuration?.title = "https://teespece.com/dachshund-shirts-collection"
        }
    }
    override func awakeFromNib() {
        updateUI()
        headImageView.layer.cornerRadius = headImageView.bounds.width/2
    }
}
