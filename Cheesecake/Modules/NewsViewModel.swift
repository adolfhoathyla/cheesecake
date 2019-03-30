//
//  NewsViewModel.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 23/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NewsViewModelProtocol {
    var items: BehaviorRelay<[Item]> { get set }
    var isLoading: PublishSubject<Bool> { get set }
    var provider: Networkable { get set }
    func requestNews(disposeBag: DisposeBag)
    func numberOfRows() -> Int
    func getItem(in indexPath: IndexPath) -> Item
}

class NewsViewModel: NSObject, NewsViewModelProtocol {
    
    var items: BehaviorRelay<[Item]> = BehaviorRelay(value: [])
    var isLoading: PublishSubject<Bool> = PublishSubject()
    var provider: Networkable = NetworkManager()
    
    // MARK: - request data
    func requestNews(disposeBag: DisposeBag) {
        isLoading.onNext(true)
        
        provider.getAllItems(disposeBag: disposeBag) { [weak self] (items, success, error) in
            self?.isLoading.onNext(false)
            if let items = items, success, error == nil {
                self?.items.accept(items)
            } else {
                print(error ?? "Error nil")
            }
        }

    }

    // MARK: - table view
    func numberOfRows() -> Int {
        return items.value.count
    }
    
    func getItem(in indexPath: IndexPath) -> Item {
        return items.value[indexPath.row]
    }
    
}
