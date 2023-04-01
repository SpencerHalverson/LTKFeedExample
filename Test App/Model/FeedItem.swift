//
//  FeedItem.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation

struct FeedResult: Codable {
    var feedItems: [FeedItem] = []
    
    enum CodingKeys: String, CodingKey {
        case feedItems = "ltks"
    }
}

struct FeedItem: Codable, Identifiable {
    let heroImage: String
    let heroImageWidth: Int
    let heroImageHeight: Int
    let id: String
    let profileID: String
    let profileUserID: String
    let videoMediaID: String?
    let status: String
    let caption: String
    let shareURL: String
    //TODO: Add date formatter to decoder and change these back to date type.
    let dateCreated: String
    let dateUpdated: String?
    let dateScheduled: String?
    let datePublished: String
    let productIDS: [String]
    let hash: String
    

    enum CodingKeys: String, CodingKey {
        case heroImage = "hero_image"
        case heroImageWidth = "hero_image_width"
        case heroImageHeight = "hero_image_height"
        case id
        case profileID = "profile_id"
        case profileUserID = "profile_user_id"
        case videoMediaID = "video_media_id"
        case status, caption
        case shareURL = "share_url"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case dateScheduled = "date_scheduled"
        case datePublished = "date_published"
        case productIDS = "product_ids"
        case hash
    }
}
