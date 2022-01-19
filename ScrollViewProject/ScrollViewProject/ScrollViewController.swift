//
//  ScrollViewController.swift
//  ScrollViewProject
//
//  Created by MacOS on 19.01.2022.
//

import UIKit

class ScrollViewController: UIViewController , UIScrollViewDelegate {
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.bounds.width*5, height: 818)
    }
    
 

}
