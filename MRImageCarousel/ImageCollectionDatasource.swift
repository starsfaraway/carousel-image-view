//
//  ImageCollectionDatasource.swift
//  MRImageCarousel
//
//  Created by Matthew Riley on 4/22/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//


import UIKit


class ImageCollectionDatasource: NSObject, UICollectionViewDataSource {
    
    var imageArray : [String] = []
    var isNibRegistered = false

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let item = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image_cell", for: indexPath)
        
        self.setupAnimations(forCell: cell, collectionView: collectionView)
        
        if let url = URL(string: imageArray[item]) {
            self.setImageForCell(cell: cell as! MRCollectionCell, url: url)
            return cell
        }else{
            return cell}
    }
    
    func setImageForCell(cell : MRCollectionCell, url : URL) {
        
        if(cell.imageView.image == nil){
            cell.spinner.stopAnimating()
        }
        
        let reqt = URLRequest(url: url)
        cell.imageView.setImageWith(reqt, placeholderImage: #imageLiteral(resourceName: "penny"), success: { (theRequest, theResponse, theImage) in
            cell.imageView.image = theImage
            cell.spinner.stopAnimating()
        }, failure: { (theRequest, theResponse, theError) in
            cell.spinner.stopAnimating()
        })
    }
    
    func setupAnimations(forCell : UICollectionViewCell, collectionView : UICollectionView) {
        //FIXME: ONLY ANIMATES WHEN FIRST DRAWING DEQUEUEABLE CELL
        let finalFrame = forCell.frame
        let translation = collectionView.panGestureRecognizer.translation(in: collectionView.superview)
        if(translation.x > 0 || translation.x < collectionView.frame.size.width) {
            forCell.frame = CGRect(x: finalFrame.origin.x, y: forCell.center.y, width: finalFrame.width, height: 0.0)
        }else{
            forCell.frame = CGRect(x: finalFrame.origin.x, y: forCell.center.y, width: finalFrame.width, height: 0.0)}
        forCell.alpha = 0.5
        
        UIView.animate(withDuration: 0.5) {
            forCell.frame = finalFrame
            forCell.alpha = 1.0
        }
    }
    
    
    func scrollForwardOne(collectionView : UICollectionView) {
        let cell = collectionView.visibleCells[0]
        //Should be only one visible
        let indexPath = collectionView.indexPath(for: cell)
        var newIndexPath : NSIndexPath
        var animated = true
        if((indexPath?.item)! < self.imageArray.count - 1) {
            newIndexPath = NSIndexPath(item: (indexPath?.item)! + 1, section: 0)}
        else{
            newIndexPath = NSIndexPath(item: 0, section: 0)
            animated = false}
        
        collectionView.scrollToItem(at: newIndexPath as IndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: animated)
    }
    
    func scrollBackOne(collectionView : UICollectionView) {
        let cell = collectionView.visibleCells[0]
        //Should be only one visible
        let indexPath = collectionView.indexPath(for: cell)
        var newIndexPath : NSIndexPath
        var animated = true
        if((indexPath?.item)! > 0) {
            newIndexPath = NSIndexPath(item: (indexPath?.item)! - 1, section: 0)}
        else{
            newIndexPath = NSIndexPath(item: self.imageArray.count - 1, section: 0)
            animated = false}
        
        collectionView.scrollToItem(at: newIndexPath as IndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: animated)
    }
    


}
