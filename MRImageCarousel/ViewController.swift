//
//  ViewController.swift
//  MRImageCarousel
//
//  Created by Matthew Riley on 4/22/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewHandler = ImageCollectionDatasource()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionView()
        self.populateArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: SETUP UI
    
    func setupCollectionView()  {
        let nibName = UINib(nibName: "MRCollectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "image_cell")
        self.collectionViewHandler.imageArray = []
        self.collectionView.delegate = self
        self.collectionView.dataSource = collectionViewHandler
    }
    
    func populateArray() {
        let eth = "https://www.cryptocoinsnews.com/wp-content/uploads/2015/04/11-ethereum.png"
        let btc = "https://bitcoin.org/img/icons/opengraph.png"
        let dash = "https://www.dash.org/wp-content/uploads/2015/04/dash_circle_highres.png"
        let doge = "https://s3.amazonaws.com/main-newsbtc-images/2015/02/EJbc9MA2.png"
        self.collectionViewHandler.imageArray = [eth,btc,dash,doge]
    }
    
    //MARK: BUTTONS
    @IBAction func scrollBack(_ sender: Any) {
        self.collectionViewHandler.scrollBackOne(collectionView: self.collectionView)
    }
    
    @IBAction func scrollForward(_ sender: Any) {
        self.collectionViewHandler.scrollForwardOne(collectionView: self.collectionView)
    }

    //MARK: UICollectionView Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //FIXME: Use control flow class?
        let nextVC = MRImagePreviewVC()
        nextVC.selectedImage = (collectionView.cellForItem(at: indexPath) as! MRCollectionCell).imageView.image
        self.present(nextVC, animated: true) { }
    }


}

