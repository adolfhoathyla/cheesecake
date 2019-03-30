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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        viewModel.isLoading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        
        viewModel.requestNews(disposeBag: disposeBag)
        
        viewModel.items.subscribe { [weak self] (event) in
            self?.tableView.reloadData()
            print(event)
        }.disposed(by: disposeBag)
    }
    
    private func configTableView() {
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: CellRestorationID.itemRestorationID, bundle: nil),
                           forCellReuseIdentifier: CellReuseIdentifier.itemCellReuseIdentifier)
        tableView.tableFooterView = UIView()
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.itemCellReuseIdentifier,
                                                 for: indexPath) as? ItemTableViewCell
        cell?.config(item: viewModel.getItem(in: indexPath))
        return cell ?? UITableViewCell()
    }
}
