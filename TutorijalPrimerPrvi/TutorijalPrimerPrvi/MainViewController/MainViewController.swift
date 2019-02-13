//
//  ViewController.swift
//  TutorijalPrimerPrvi
//
//  Created by Robert on 2/13/19.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openingTutorial(_ sender: Any) {
//        let alert = UIAlertController(title: "Button clicked!", message: "Tutorial open!", preferredStyle: .alert)
//        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
//        alert.addAction(dismissButton)
//        self.present(alert, animated: true, completion: nil)

        
        // klikom na dugme otvaramo tutorijal
//        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
//        if let walktroughViewController = storyboard.instantiateViewController(withIdentifier: "walktroughViewController") as? WalktroughViewController {
//            present(walktroughViewController, animated: true, completion: nil)
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        if UserDefaults.standard.bool(forKey: "hasViewedWalktrough") {
//            return
//        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let walktroughViewController = storyboard.instantiateViewController(withIdentifier: "walktroughViewController") as? WalktroughViewController {
            present(walktroughViewController, animated: true, completion: nil)
        }
    }
    
}

