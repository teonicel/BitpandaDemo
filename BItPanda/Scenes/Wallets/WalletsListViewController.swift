//
//  WalletsListViewController.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

class WalletsListViewController: UIViewController, WalletsListViewProtocol {
    var presenter: WalletsListPresenterProtocol?
    
    lazy private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(WalletsListCell.self, forCellReuseIdentifier: WalletsListCell.reuseKey)
        table.estimatedRowHeight = UITableView.automaticDimension
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(tableView)
        tableView.snapMargins()
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            tableView.reloadData()
        }
    }
}

extension WalletsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.walletSectionsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.walletsCountFor(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.walletTitleFor(section: section) ?? ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WalletsListCell.reuseKey, for: indexPath)
        if let wallet = presenter?.walletFor(indexPath: indexPath),
            let walletCell = cell as? WalletsListCell {
            
            walletCell.config(with: wallet)
            return walletCell
        }
        return cell
    }
}
