//
//  NewsViewController.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 23/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NewsViewController: UIViewController {

    let viewModel: NewsViewModelProtocol! = NewsViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.isLoading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        
        viewModel.requestNews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
