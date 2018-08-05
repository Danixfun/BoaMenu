//
//  MultipleMenus.swift
//  ExampleProject
//
//  Created by Daniel Tejeda on 05/08/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

class MultipleMenus: UIViewController {
    
    //MARK: - Properties
    var aboveMenu:BoaMenu!
    var belowMenu:BoaMenu!
    
    //MARK: - IBAction
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopMenu()
        setUpBottomMenu()
    }
    
    func setUpTopMenu(){
        aboveMenu = BoaMenu.DefaultMenu(target: self)
        aboveMenu.backgroundColor = .purple
        aboveMenu.setIcons(["black","black","black","black","black"])
    }
    
    func setUpBottomMenu(){
        let template = BoaMenuTemplate(frame: BoaMenuTemplate.defaultBoaMenuTopFrame(target: self), backgroundColor: .brown, numberOfButtons: 3)
        belowMenu = BoaMenu.WithTemplate(template: template, target: self)
        belowMenu.setIcons(["blue","blue","blue"])
    }
    
    

    

}
