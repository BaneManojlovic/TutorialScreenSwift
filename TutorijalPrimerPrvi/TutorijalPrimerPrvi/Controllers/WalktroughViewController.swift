//
//  WalktroughViewController.swift
//  TutorijalPrimerPrvi
//
//  Created by Robert on 2/13/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

class WalktroughViewController: UIViewController, WalktroughPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 10.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!
    
    // MARK: - Properties
    
    var walktroughPageViewController: WalktroughPageViewController?
    
    // MARK: - Actions
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        // TODO: - ovde aplikacija crash-uje
        UserDefaults.standard.set(true, forKey: "hasViewedWalktrough")
       dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walktroughPageViewController?.currentIndex {
            switch index {
            case 0...4:
                walktroughPageViewController?.forwardPage()
            case 5:
                UserDefaults.standard.set(true, forKey: "hasViewedWalktrough")
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        updateUI()
    }
    
    //Ova metoda apdejtuje koja od tackica je crvena, tj koja strana tutorijala je otvorena
    //takodje ona i setuje da skip dugme postane sakriveno kada se dodje do kraja tutorijala
    func updateUI() {
        if let index = walktroughPageViewController?.currentIndex {
            switch index {
            case 0...4:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 5:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default: break
            }
            pageControl.currentPage = index
        }
    }
    
    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalktroughPageViewController {
            walktroughPageViewController = pageViewController
            walktroughPageViewController?.walktroughDelegate = self
        }
    }
   
}
