//
//  Profile.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation

// MARK: - ProfileResult
struct ProfileResult: Codable {
    let profile: Profile
}

// MARK: - Profile
struct Profile: Codable {
    let id, displayName, instagramName, blogName: String
    let blogURL, fullName: String?
    let rsAccountID: Int?
    let avatarURL: String
    let avatarUploadURL: String?
    let hasUploadedAvatarImage, searchable: Bool?
    let bio: String?
    let bgImageURL: String?
    let bgUploadURL: String?
    let hasUploadedBgImage: Bool?
    let classification: Classification?
    let createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case instagramName = "instagram_name"
        case blogName = "blog_name"
        case blogURL = "blog_url"
        case fullName = "full_name"
        case rsAccountID = "rs_account_id"
        case avatarURL = "avatar_url"
        case avatarUploadURL = "avatar_upload_url"
        case hasUploadedAvatarImage = "has_uploaded_avatar_image"
        case searchable, bio
        case bgImageURL = "bg_image_url"
        case bgUploadURL = "bg_upload_url"
        case hasUploadedBgImage = "has_uploaded_bg_image"
        case classification
        case createdAt = "created_at"
    }
}

// MARK: - Classification
struct Classification: Codable {
    let height: Double?
    let bodyShapes: [BodyShape]?

    enum CodingKeys: String, CodingKey {
        case height
        case bodyShapes = "body_shapes"
    }
}

// MARK: - BodyShape
struct BodyShape: Codable {
    let type, value: String?
}
