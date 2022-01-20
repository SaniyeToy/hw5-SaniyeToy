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
        pageControl.backgroundColor = .clear
        configurePageControl()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        scheduledTimerWithTimeInterval()
    }
 
    func createViews(){
        
        let mintView = UIView()
        mintView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 818)
        mintView.backgroundColor = .systemMint
        scrollView.addSubview(mintView)
        let pinkView = UIView()
        pinkView.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width*2, height: 818)
        pinkView.backgroundColor = .systemPink
        scrollView.addSubview(pinkView)
        let purpleView = UIView()
        purpleView.frame = CGRect(x: view.frame.width*2, y: 0, width: view.frame.width*3, height: 818)
        purpleView.backgroundColor = .systemPurple
        scrollView.addSubview(purpleView)
        let orangeView = UIView()
        orangeView .frame = CGRect(x: view.frame.width*3, y: 0, width: view.frame.width*4, height: 818)
        orangeView .backgroundColor = .systemOrange
        scrollView.addSubview(orangeView)
        let indigoView = UIView()
        indigoView.frame = CGRect(x: view.frame.width*4, y: 0, width: view.frame.width*5, height: 818)
        indigoView.backgroundColor = .systemIndigo
        scrollView.addSubview(indigoView)
        
    }
    func configurePageControl() {
        self.pageControl.numberOfPages = 5
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2);
        self.pageControl.tintColor = UIColor.blue
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 3 seconds
        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.animateScrollView), userInfo: nil, repeats: true)
    }

    @objc func animateScrollView() {
        let scrollWidth = scrollView.bounds.width
        let currentXOffset = scrollView.contentOffset.x
        print(scrollWidth)
        let lastXPos = currentXOffset + scrollWidth
        if lastXPos != scrollView.contentSize.width {
            print("Scroll")
            scrollView.setContentOffset(CGPoint(x: lastXPos, y: 0), animated: true)
        }
        else {
            print("Scroll to start")
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      //  print(scrollView.contentOffset)
        let scrollWidth = scrollView.bounds.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(scrollWidth))
    }
}
