//
//  Post.swift
//  Instagram Demo
//
//  Created by Shien on 2022/5/17.
//

import Foundation
import UIKit

struct AccountPage: Decodable {
    var graphql: User
}

struct User: Decodable {
    var user: Post
}
//
struct Post: Decodable {
    var edge_owner_to_timeline_media: MediaTimeLine
}

struct MediaTimeLine: Decodable {
    var edges: [MediaTimeLineNode]
}

struct MediaTimeLineNode: Decodable {
    var node: [NodeOfMedia]
}
//
struct NodeOfMedia: Decodable {
    var display_url: URL?
    var owner: ownerOfMedia
    var video_view_count: Int?
    var edge_media_to_caption: [edgeMediaToCaption]
    var edge_media_to_comment: edgeMediaToComment
    var edge_liked_by: edgeLikedBy
}

struct ownerOfMedia:Decodable {
    var username: String
}

struct edgeMediaToCaption: Decodable {
    var node: TextOfCaption
}

struct TextOfCaption: Decodable {
    var text: String
}

struct edgeMediaToComment: Decodable {
    var count: Int
}

struct edgeLikedBy: Decodable {
    var count: Int
}

struct FollowedBy: Decodable {
    var count: Int
}

struct Follow: Decodable {
    var count: Int
}


