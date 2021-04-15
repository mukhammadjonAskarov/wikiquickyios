//
//  AppIntroductionVC.swift
//  WikiQuicky
//
//  Created by Mukhammadjon Askarov on 14/04/21.
//

import UIKit

class AppIntroductionVC: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
        return collectionView
    }()
    
    
    lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
        pageControl.backgroundColor = .white
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    lazy var skipButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = .blue
        button.setTitleColor(.red, for: .normal)
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo" , size: 22)
        button.backgroundColor = .clear
        button.setTitleColor(#colorLiteral(red: 0.9561744332, green: 0.4215260744, blue: 0.1619517207, alpha: 1), for: .normal)
        //button.layer.cornerRadius = 5
        //button.layer.borderWidth = 1
        
        return button
    }()
    
    var pages = [
        Page(image: ImageName.page1.image, title: "Get Your job done, Get your Product Delivered"),
        Page(image: ImageName.page2.image, title: "Get Your job done, Get your Product Delivered"),
        Page(image: ImageName.page3.image, title: "Get Your job done, Get your Product Delivered"),
        Page(image: ImageName.page4.image, title: "Get Your job done, Get your Product Delivered"),
        Page(image: ImageName.page5.image, title: "Get Your job done, Get your Product Delivered")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.register(PagesCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
        
        configureUI()
        UserDefaults.standard.setValue(true, forKey: "launchedBefore")
    }
    
    func configureUI(){
        view.addSubview(skipButton)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height*0.6)
        ])
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
           
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           // skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            skipButton.heightAnchor.constraint(equalToConstant: 48),
            skipButton.widthAnchor.constraint(equalToConstant: 48),
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            //skipButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
           // pageControl.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -20),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 2),
            pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor)
            //pageControl.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
    
}

extension AppIntroductionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let page = pages[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PagesCell
        
        cell.imageView.image = page.image
        cell.titleLabel.text = page.title
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if(indexPath.row == 0){
            self.pageControl.currentPage = 0
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
            
        }
        if(indexPath.row == 1){
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
            self.pageControl.currentPage = 1
        }
        if(indexPath.row == 2){
            self.pageControl.currentPage = 2
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
        }
        if(indexPath.row == 3){
            self.pageControl.currentPage = 3
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
        }
        if(indexPath.row == 4){
            self.pageControl.currentPage = 4
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
        }
        if(indexPath.row == 5){
            self.pageControl.currentPage = 5
            self.pageControl.tintColor = #colorLiteral(red: 0.9996598363, green: 0.8336259723, blue: 0.1565588117, alpha: 1)
            self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.7685508132, green: 0.7686812282, blue: 0.7685336471, alpha: 1)
        }
    }
    
}

