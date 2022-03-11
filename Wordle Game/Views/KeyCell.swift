//
//  File.swift
//  Wordle Game
//
//  Created by mohamedSliem on 3/11/22.
//

import UIKit

class KeyCell : UICollectionViewCell {
    static let identifier = "KeyCell Identifier"
    
    
    private let charLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight : .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(charLabel)
        NSLayoutConstraint.activate([
            charLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            charLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            charLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            charLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        charLabel.text = nil
    }
    
    
    func configure(letter : Character){
        charLabel.text = String(letter).uppercased()
    }
}
