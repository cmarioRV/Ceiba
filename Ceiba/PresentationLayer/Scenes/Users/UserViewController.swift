//
//  UserViewController.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit

protocol UserViewControllerProtocol: AnyObject {
    var onShowPosts: ((Int) -> Void)? { get set }
}

class UserViewController: UIViewController {
    
    var onShowPosts: ((Int) -> Void)?
    var viewModel: UserViewModelType!
    let searchController = UISearchController(searchResultsController: nil)
    
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
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier())
        return tableView
    }()

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        bindViewModel()
        
        viewModel.inputs.getUsers()
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
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "entry_name".localized
        navigationItem.searchController = searchController
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
        case is UserCellViewModel:
            return UserTableViewCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.cellViewModels.value.count
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
        onShowPosts?(viewModel.outputs.cellViewModels.value[indexPath.row].userId)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UserViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.inputs.search(name: searchController.searchBar.text!)
    }
}
