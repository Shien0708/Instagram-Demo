//
//  AccountsCollectionReusableView.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/18.
//

import UIKit

class AccountsCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var pageCountsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    func updateUI() {
        messageButton.layer.borderWidth = 1
        messageButton.layer.cornerRadius = messageButton.bounds.height/4
        optionButton.layer.borderWidth = 1
        optionButton.layer.cornerRadius = optionButton.bounds.height/4
        pageCountsLabel.text = "1434\nPosts"
        if let url = URL(string: "https://instagram.ftpe12-2.fna.fbcdn.net/v/t51.2885-19/75272186_849728705447448_1957039476630880256_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.ftpe12-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=66AYAm3nJwYAX-JHef6&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-LmJPKSiHRu9Ws2T6m-uPKXQUcoWRpbEYjyqyT1A5tIQ&oe=628A4D03&_nc_sid=7bff83") {
            do {
                headImageView.image = try UIImage(data: Data(contentsOf: url))
            } catch { fatalError() }
        }
        
        followersLabel.text = "12 K\nFollowers"
        followingLabel.text = "4312\nFollowing"
        bioLabel.text = "🐶 We ❤️ Dachshund!!\n👇 Need Feature? on our page? DM us!!\n🛒 Shop Cute Dachshund Items 👇"
       
        fullNameLabel.text = "Dachshund Lovers 🐾"
        linkButton.configuration?.title = "https://teespece.com/dachshund-shirts-collection"
       
    }
    
    override func awakeFromNib() {
        headImageView.layer.cornerRadius = headImageView.bounds.width/2
        headImageView.layer.borderWidth = 2
        headImageView.layer.borderColor = CGColor(red: 1, green: 0, blue: 0.2, alpha: 0.6)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
}
