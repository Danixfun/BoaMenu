//
//  Custom.swift
//  ExampleProject
//
//  Created by Daniel Tejeda on 04/08/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

class Custom: UIViewController {
    
    //MARK: - Properties
    var menu:BoaMenu!
    
    //MARK: - IBOutlet
    @IBOutlet weak var backButton: UIButton!
    
    //MARK: - IBAction
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Menu creation
        let frame = CGRect(x: (view.frame.size.width/4), y: view.frame.height-80, width: view.frame.size.width/2, height: 80)
        let template = BoaMenuTemplate(frame: frame, backgroundColor: .black, numberOfButtons: 2)
        menu = BoaMenu.WithTemplate(template: template, target: self)
        
        menu.setIcons(["square","rounded"])
        menu.setAction(withIndex: 0, selector: #selector(setSquare))
        menu.setAction(withIndex: 1, selector: #selector(setRounded))
    }

    
    
    //MARK: - Selectors
    @objc func setSquare(){
        backButton.setNeedsLayout()
        backButton.layer.cornerRadius = 0
    }
    
    @objc func setRounded(){
        backButton.setNeedsLayout()
        backButton.layer.cornerRadius = backButton.frame.size.height / 4
    }

    

}
