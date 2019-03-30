//
//  Networkable.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 30/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit
import Moya
import RxSwift

protocol Networkable {
    var provider: MoyaProvider<ItemApi> { get }
    func getAllItems(disposeBag: DisposeBag,
                     completionHandler: @escaping ([Item]?, Bool, Error?) -> ())
}
