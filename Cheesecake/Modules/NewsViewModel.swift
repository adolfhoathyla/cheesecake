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
    var itens: BehaviorRelay<[Item]> { get set }
    var isLoading: PublishSubject<Bool> { get set }
    func requestNews()
    func numberOfRows() -> Int
    func getItem(in indexPath: IndexPath) -> Item
}

class NewsViewModel: NSObject, NewsViewModelProtocol {
    
    var itens: BehaviorRelay<[Item]> = BehaviorRelay(value: [])
    var isLoading: PublishSubject<Bool> = PublishSubject()
    
    // MARK: - request data
    func requestNews() {
        isLoading.onNext(true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) { [weak self] in
            self?.isLoading.onNext(false)
            self?.itens.accept(Mock.getAllItens())
        }
    }

    // MARK: - table view
    func numberOfRows() -> Int {
        return itens.value.count
    }
    
    func getItem(in indexPath: IndexPath) -> Item {
        return itens.value[indexPath.row]
    }
    
}
