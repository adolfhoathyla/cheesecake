//
//  Item.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 23/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit

class Item: NSObject {
    var title: String?
    var website: String?
    var authors: String?
    var date: String?
    var content: String?
    var image_url: String?
    
    init(title: String?, website: String?, authors: String?, date: String?, content: String?, image_url: String?) {
        self.title = title
        self.website = website
        self.authors = authors
        self.date = date
        self.content = content
        self.image_url = image_url
    }
}
