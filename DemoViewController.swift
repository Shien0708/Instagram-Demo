//
//  DemoViewController.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/17.
//

import UIKit

class DemoViewController: UIViewController, UINavigationControllerDelegate {
    let reuseIdentifier = "\(DemoTableViewCell.self)"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension DemoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("it works")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath) as! DemoCollectionViewCell
        
        do {
            cell.demoImageView.image = try UIImage(data: Data(contentsOf: data[indexPath.item].edge_owner_to_timeline_media.edges[0].node[0].display_url!))

        } catch {fatalError()}
        
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}



extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DemoTableViewCell
        if cell.backgroundColor == .blue {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        
        do {
            if let url = data[indexPath.row].edge_owner_to_timeline_media.edges[0].node[0].display_url {
                cell.demoImageView.image = try UIImage(data: Data(contentsOf:url))
            }
            
        }catch{fatalError()}
        return cell
    }
    
    
}
