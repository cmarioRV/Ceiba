//
//  UserTableViewCell.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell, CellConfigurable {
    
    var viewModel: UserCellViewModel?
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        return lbl
    }()
    
    let phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        return lbl
    }()
    
    let emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? UserCellViewModel else { return }
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        phoneLabel.text = viewModel.phone
        emailLabel.text = viewModel.email
    }
    
    fileprivate func configureContents() {
        let guides = contentView.safeAreaLayoutGuide
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: guides.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: guides.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(emailLabel)
        
        contentView.layoutIfNeeded()
    }
}
