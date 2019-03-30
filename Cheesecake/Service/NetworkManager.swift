//
//  NetworkManager.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 30/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit
import Moya
import RxSwift

struct NetworkManager: Networkable {
    var provider = MoyaProvider<ItemApi>()
    
    func getAllItems(disposeBag: DisposeBag, completionHandler: @escaping ([Item]?, Bool, Error?) -> ()) {
        provider.rx.request(.getAllItems()).map([Item].self).subscribe({ (event) in
            switch event {
            case .success(let items):
                completionHandler(items, true, nil)
            case .error(let error):
                completionHandler(nil, false, error)
            }
        }).disposed(by: disposeBag)
    }
    

}
