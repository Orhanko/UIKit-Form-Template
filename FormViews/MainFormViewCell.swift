//
//  MainFormViewCell.swift
//  FormViews
//
//  Created by Orhan Pojskic on 12/1/24.
//
import UIKit

class CustomTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Postavi sliku
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)

        // Postavi labelu
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        contentView.addSubview(titleLabel)

        // Auto Layout
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 32),
            iconImageView.heightAnchor.constraint(equalToConstant: 32),

            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()

            // Podesi separator tako da počinje tamo gde počinje tekst
            self.separatorInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)

            // Opcionalno resetuj margine ako koristiš custom layout margine
            self.layoutMargins = UIEdgeInsets.zero
        }
}
