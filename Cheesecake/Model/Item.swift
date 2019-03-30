//
//  Item.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 23/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit

struct Item {
    var title: String?
    var website: String?
    var authors: String?
    var date: String?
    var content: String?
    var imageUrl: String?
}

extension Item: Decodable {
    enum ItemCodingKeys: String, CodingKey {
        case title
        case website
        case authors
        case date
        case content
        case imageUrl = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        website = try container.decode(String.self, forKey: .website)
        authors = try container.decode(String.self, forKey: .authors)
        date = try container.decode(String.self, forKey: .date)
        content = try container.decode(String.self, forKey: .content)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
}
