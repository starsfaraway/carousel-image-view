//
//  MRFlowLayout.swift
//  MRImageCarousel
//
//  Created by Matthew Riley on 4/22/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//
//
// ***********************************************************************************
//
// Not implemented in this project yet
//
// /***********************************************************************************
//
 
import UIKit

class MRFlowLayout: UICollectionViewFlowLayout {
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 1000, height: 240)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attr0 = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 0, section: 0))
        let attr1 = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 1, section: 0))
        let attr2 = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 2, section: 0))
        let attr3 = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 3, section: 0))
        
        attr0.frame = CGRect(x: 0.0, y: 0.0, width: 240.0, height: 240.0)
        attr1.frame = CGRect(x: 240.0, y: 0.0, width: 240.0, height: 240.0)
        attr2.frame = CGRect(x: 480.0, y: 0.0, width: 240.0, height: 240.0)
        attr3.frame = CGRect(x: 720.0, y: 0.0, width: 240.0, height: 240.0)
        
        return [attr0, attr1, attr2, attr3]
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = self.layoutAttributesForItem(at: itemIndexPath)
        if(itemIndexPath.item == 0){
            return attr
        }else{
            attr?.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            return attr
        }
        
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = self.layoutAttributesForItem(at: itemIndexPath)
        attr?.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        return attr
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        let oldBounds = self.collectionView?.bounds
        if(__CGSizeEqualToSize((oldBounds?.size)!, newBounds.size)) {
            return true
        }
        return false
    }

}
