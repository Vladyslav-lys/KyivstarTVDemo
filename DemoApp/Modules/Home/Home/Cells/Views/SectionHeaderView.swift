//
//  SectionHeader.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 29.08.2024.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    // MARK: - Constants
    private enum C {
        static let titleLeadingPadding: CGFloat = 24
    }
    
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = Constants.headerTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Del", for: .normal)
        button.setTitleColor(R.color.navy()!, for: .normal)
        button.titleLabel?.font = Constants.headerButtonFont
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return button
    }()
    
    // MARK: - Private Properties
    private var section: HomeVC.Section?
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNameLabel()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    private func setupNameLabel() {
        addSubview(titleLabel)
        
        with(titleLabel) {
            $0.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        }
    }
    
    private func setupButton() {
        addSubview(deleteButton)
        
        with(deleteButton) {
            $0.heightAnchor.constraint(equalToConstant: 28).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 24).isActive = true
            $0.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: C.titleLeadingPadding).isActive = true
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
        }
    }
    
    // MARK: - Configure
    func configure(section: HomeVC.Section) {
        self.section = section
        titleLabel.text = section.name
    }
}
