//
//  KeyboardVC.swift
//  Wordle Game
//
//  Created by mohamedSliem on 3/11/22.
//

import UIKit

class KeyboardVC: UIViewController {
   private let chars = ["qwertyuio","asdfghjkl","zxcvbnm"]
   private var keyboardChars: [[Character]] = []
    
  private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 3
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        
    }
    
    private func configureCollectionView() {
       
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension KeyboardVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyboardChars[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as! KeyCell
        cell.configure(letter:keyboardChars[indexPath.section][indexPath.row])
        return cell
    }
    
    
}
