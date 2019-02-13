//
//  WalktroughPageViewController.swift
//  TutorijalPrimerPrvi
//
//  Created by Robert on 2/13/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

protocol WalktroughPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalktroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // MARK: - Properties
    var pageHeadings = ["Audi A6", "Audi A8", "BMW 5", "Mercedes c220", "Ford Mustang", "Mustang"]
    var pageImages = ["audi_drugi", "audi_prvi", "bmw", "mercedes_drugi", "mustang_drugi", "mustang_prvi"]
    var pageSubHeadings = ["2010", "2012", "2011", "2012", "2010", "2015", "1968"]
    var currentIndex = 0
    
    weak var walktroughDelegate: WalktroughPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setujem data source to itself
        dataSource = self
        delegate = self
        
        // Create first walktrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalktroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalktroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    // MARK: - Helper
    
    func contentViewController(at index: Int) -> WalktroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // kreira novi view controller
        let storybord = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "walktroughtContentViewController") as? WalktroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - PageViewControllerDelegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalktroughContentViewController {
                currentIndex = contentViewController.index
                
                walktroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
    
}
