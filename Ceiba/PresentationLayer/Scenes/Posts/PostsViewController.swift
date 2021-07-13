//
//  PostsViewController.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit

class PostsViewController: UIViewController {
    
    var viewModel: PostViewModelType!
    var userId: Int?
    
    var contentView: UIView = {
       let view = UIView()
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.showsVerticalScrollIndicator = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellIdentifier())
        return tableView
    }()

    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        bindViewModel()
        
        if let userId = userId {
            viewModel.inputs.getPostsByUser(userId)
        }
    }
    
    func setViews() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
                
        let guides = self.view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guides.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
        
        definesPresentationContext = true
        
        view.layoutIfNeeded()
    }
    
    func bindViewModel() {
        viewModel.outputs.cellViewModels.bind { [weak self] viewModels in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.outputs.isBussy.bind { [weak self] isBussy in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                if isBussy {
                    weakSelf.showSpinner()
                } else {
                    weakSelf.removeSpinner()
                }
            }
        }
        
        viewModel.outputs.error.bind { [weak self] error in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                weakSelf.showAlertWith(title: "error_title".localized, body: "error_description".localized)
            }
        }
    }
    
    func cellIdentifier(for viewModel: CellViewModel) -> String {
        switch viewModel {
        case is PostCellViewModel:
            return PostTableViewCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.cellViewModels.value.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel.outputs.cellViewModels.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: rowViewModel), for: indexPath)

        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }

        cell.selectionStyle = .none
        cell.layoutIfNeeded()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        onShowPosts?(viewModel.outputs.cellViewModels.value[indexPath.row].userId)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
