//
//  Page2.swift
//  Test
//
//  Created by John Chen on 2/12/24.
//

import UIKit

class Page2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var month: Date = Date()
    var days: [Date] = []
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDays()
        setupCollectionView()
    }
    
    private func setupDays() {
        days = generateDays(for: month)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        configureLayout(layout)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func configureLayout(_ layout: UICollectionViewFlowLayout) {
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let width = (view.frame.size.width - layout.sectionInset.left - layout.sectionInset.right - (layout.minimumInteritemSpacing * 6)) / 7
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Navigation Controller: \(String(describing: navigationController))")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        configureCell(cell, forItemAt: indexPath)
        return cell
    }
    
    private func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        let day = days[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        label.text = dateFormatter.string(from: day)
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.backgroundColor = UIColor.systemGray5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Date cell tapped")
        let selectedDate = days[indexPath.row]
        presentDetailViewController(for: selectedDate)
    }
    
    
    
    private func presentDetailViewController(for date: Date) {
        let detailViewController = DateDetailViewController()
        detailViewController.date = date
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func generateDays(for month: Date) -> [Date] {
        guard let range = Calendar.current.range(of: .day, in: .month, for: month) else { return [] }
        var days: [Date] = []
        
        for day in range {
            var dateComponents = DateComponents()
            dateComponents.year = Calendar.current.component(.year, from: month)
            dateComponents.month = Calendar.current.component(.month, from: month)
            dateComponents.day = day
            
            if let date = Calendar.current.date(from: dateComponents) {
                days.append(date)
            }
        }
        
        return days
    }
}


