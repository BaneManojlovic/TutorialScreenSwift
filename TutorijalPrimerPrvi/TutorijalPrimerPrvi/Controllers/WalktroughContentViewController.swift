//
//  WalktroughContentViewController.swift
//  TutorijalPrimerPrvi
//
//  Created by Robert on 2/13/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

class WalktroughContentViewController: UIViewController {
    
    // MARJ: - Outlets
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subHeadingLabel: UILabel! {
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        
    }

}
