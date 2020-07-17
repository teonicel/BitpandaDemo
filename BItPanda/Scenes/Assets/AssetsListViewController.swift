//
//  AssetsListViewController.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

final class AssetsListViewController: UIViewController, AssetsListViewProtocol {
    var presenter: AssetsListPresenterProtocol?
    
    lazy private var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: self.presenter?.assetsTypesTitles ?? [])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        return control
    }()
    
    lazy private var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(AssetsListCell.self, forCellReuseIdentifier: AssetsListCell.reuseKey)
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
        
        view.addSubview(segmentedControl)
        segmentedControl.snapMargins(to: view, edges: .zero, except: [.bottom, .top ])
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        view.addSubview(tableView)
        tableView.snapMargins(to: view, edges: .zero, except: [.top])
        
        tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16).isActive = true
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    @objc private func segmentControl(_ segmentedControl: UISegmentedControl) {
        presenter?.selectAssetsFor(index: segmentedControl.selectedSegmentIndex)
    }
}

extension AssetsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.assetNumber ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssetsListCell.reuseKey, for: indexPath)
        if let asset = presenter?.assetAt(indexPath: indexPath),
            let assetCell = cell as? AssetsListCell {
            
            assetCell.config(with: asset)
            return assetCell
        }
        return cell
    }
}
