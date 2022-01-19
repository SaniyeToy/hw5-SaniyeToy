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
        createViews()
    }
    
    func createViews(){
        
        let view1 = UIView()
        view1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 818)
        view1.backgroundColor = .red
        scrollView.addSubview(view1)
        let view2 = UIView()
        view2.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width*2, height: 818)
        view2.backgroundColor = .systemPink
        scrollView.addSubview(view2)
        let view3 = UIView()
        view3.frame = CGRect(x: view.frame.width*2, y: 0, width: view.frame.width*3, height: 818)
        view3.backgroundColor = .green
        scrollView.addSubview(view3)
        let view4 = UIView()
        view4.frame = CGRect(x: view.frame.width*3, y: 0, width: view.frame.width*4, height: 818)
        view4.backgroundColor = .yellow
        scrollView.addSubview(view4)
        let view5 = UIView()
        view5.frame = CGRect(x: view.frame.width*4, y: 0, width: view.frame.width*5, height: 818)
        view5.backgroundColor = .systemBlue
        scrollView.addSubview(view5)
        
    }
 

}
