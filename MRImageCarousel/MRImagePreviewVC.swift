//
//  MRImagePreviewVC.swift
//  MRImageCarousel
//
//  Created by Matthew Riley on 4/22/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit

class MRImagePreviewVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage : UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let image = self.selectedImage {
            self.imageView.image = image
            self.showImage()
        }else {
            self.dismiss(animated: true) {   }
        }
        self.scrollView.delegate = self
    }

    func showImage() {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView.alpha = 1.0
        }, completion: { (success) in
            
        })
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true) { }
    }

    //MARK: UISCrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }



}
