//
//  PagesCell.swift
//  WikiQuicky
//
//  Created by Mukhammadjon Askarov on 14/04/21.
//

import UIKit

class PagesCell: UICollectionViewCell {
//
//    lazy var topImageViewContainerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = #colorLiteral(red: 0.6564984322, green: 0.6467797756, blue: 0.6468245387, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
//        contentView.addSubview(topImageViewContainerView)
//
//        NSLayoutConstraint.activate([
//            topImageViewContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            topImageViewContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            topImageViewContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            topImageViewContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.6)
        ])
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
}
