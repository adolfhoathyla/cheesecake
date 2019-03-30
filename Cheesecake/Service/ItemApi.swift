//
//  ItemApi.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 30/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit
import Moya

enum ItemApi {
    case getAllItems()
}

extension ItemApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://cheesecakelabs.com")!
    }
    
    var path: String {
        return "/challenge"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return stubbedResponse("News")
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

extension ItemApi {
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
