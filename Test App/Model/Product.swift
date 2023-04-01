//
//  Product.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation

// MARK: - ProductResult
struct ProductResult: Codable {
    let product: Product
}

// MARK: - Product
struct Product: Codable {
    let id: String
    let ltkID: String
    let hyperlink: String
    let imageURL: String
    let links: Links
    let matching: String
    let productDetailsID: String
    let retailerID: String
    let retailerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id
        case ltkID = "ltk_id"
        case hyperlink
        case imageURL = "image_url"
        case links, matching
        case productDetailsID = "product_details_id"
        case retailerID = "retailer_id"
        case retailerDisplayName = "retailer_display_name"
    }
}

// MARK: - Links
struct Links: Codable {
    let androidConsumerApp, androidConsumerAppSs, iosConsumerApp, iosConsumerAppSs: String
    let ltkEmail, ltkWeb, ltkWidget, tailoredEmail: String

    enum CodingKeys: String, CodingKey {
        case androidConsumerApp = "ANDROID_CONSUMER_APP"
        case androidConsumerAppSs = "ANDROID_CONSUMER_APP_SS"
        case iosConsumerApp = "IOS_CONSUMER_APP"
        case iosConsumerAppSs = "IOS_CONSUMER_APP_SS"
        case ltkEmail = "LTK_EMAIL"
        case ltkWeb = "LTK_WEB"
        case ltkWidget = "LTK_WIDGET"
        case tailoredEmail = "TAILORED_EMAIL"
    }
}

