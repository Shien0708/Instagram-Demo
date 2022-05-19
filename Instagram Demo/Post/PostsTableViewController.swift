//
//  PostsTableViewController.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/19.
//

import UIKit

class PostsTableViewController: UITableViewController {
    let posts = Posts()
    
    static private let reuseIdentifier = "\(PostTableViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.postData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewController.reuseIdentifier, for: indexPath) as? PostTableViewCell else {return PostTableViewCell()}
        
        DispatchQueue.main.async {
            cell.updateUI(with: self.posts, at: indexPath.item)
        }
        return cell
    }
}
