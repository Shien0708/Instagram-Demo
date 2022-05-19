//
//  PostTableViewCell.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/19.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var viewCountsLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headImageView.layer.cornerRadius = headImageView.bounds.width/2
        headImageView.layer.borderColor = CGColor(red: 1, green: 0, blue: 0.4, alpha: 0.6)
        headImageView.layer.borderWidth = 2
    }
    
    func updateUI(with posts: Posts, at indexPath: Int) {
        accountNameLabel.text = posts.postData[indexPath].owner.username
        do {
            if let url = posts.postData[indexPath].display_url {
                mediaImageView.image = try UIImage(data: Data(contentsOf: url))
            }
        } catch { fatalError() }
        
        if let url = URL(string: "https://instagram.ftpe12-2.fna.fbcdn.net/v/t51.2885-19/75272186_849728705447448_1957039476630880256_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.ftpe12-2.fna.fbcdn.net&_nc_cat=100&_nc_ohc=66AYAm3nJwYAX-JHef6&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-LmJPKSiHRu9Ws2T6m-uPKXQUcoWRpbEYjyqyT1A5tIQ&oe=628A4D03&_nc_sid=7bff83") {
            do {
                headImageView.image = try UIImage(data: Data(contentsOf: url))
            } catch { fatalError() }
        }
        
        if let count = posts.postData[indexPath].video_view_count {
            viewCountsLabel.text = "\(count) views"
        }
        storyLabel.text = "\(posts.postData[indexPath].edge_media_to_caption[0].node.text)"
        commentButton.setTitle("View all \(posts.postData[indexPath].edge_media_to_comment.count) comments", for: .normal)
        timeLabel.text = "\(indexPath+5) hours ago"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
