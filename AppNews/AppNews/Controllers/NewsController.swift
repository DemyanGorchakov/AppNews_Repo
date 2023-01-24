//
//  NewsController.swift
//  AppNews
//
//  Created by Демьян Горчаков on 21.01.2023.
//

import UIKit

class NewsController: UIViewController {
    
//    1.1 создаем коллекцию типа UICollectionView!
    var collectionView: UICollectionView!
    
    let service = Service()
    var data = [Articles]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()

        service.getNews { item in
            self.data = item.articles
            self.collectionView.reloadData()
        }
    }
    
//  2 содаем размеры ячеек и отступы с помощью функции и передаем в п.1
    private func setloyaut() -> UICollectionViewFlowLayout {
        let layaut = UICollectionViewFlowLayout()
        layaut.minimumInteritemSpacing = 0
        layaut.minimumLineSpacing = 0
        
        return layaut
    }
    
//   1.2 создаем коллекцию
//       регистрируем ячейку
//       добавляем делегаты
//       добавляем addSubview
//       с помощью функции и вызываем ее во viewDidLoad
    func setCollectionView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: setloyaut())
        collectionView.register(UINib(nibName: ViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: ViewCell.reuseId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
    }
}
//   3.1 создаем расширения Delegate и DataSource
extension NewsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        3.2 регистрируем переиспользуемую ячейку
//            добавляем в нее данные
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.reuseId, for: indexPath) as? ViewCell {
            
            let articles = data[indexPath.row]
            cell.setCell(articles)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        
        return CGSize(width: size.width, height: size.height)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue",
           let destFirstVC = segue.destination as? SecondViewController,
           let index = collectionView.indexPathsForSelectedItems?.first?.row {
            destFirstVC.imageFVC = data[index].urlToImage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
}
