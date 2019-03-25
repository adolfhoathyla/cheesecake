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
    var itens: PublishSubject<[Item]> { get set }
    var isLoading: PublishSubject<Bool> { get set }
    func requestNews()
}

class NewsViewModel: NSObject, NewsViewModelProtocol {
    
    var itens: PublishSubject<[Item]> = PublishSubject()
    var isLoading: PublishSubject<Bool> = PublishSubject()
    
    func requestNews() {
        isLoading.onNext(true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) { [weak self] in
            self?.isLoading.onNext(false)
        }
    }

}
