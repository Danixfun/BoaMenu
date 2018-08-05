//
//  Form.swift
//  ExampleProject
//
//  Created by Daniel Tejeda on 04/08/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

class Form: UIViewController {
    
    //MARK: - Properties
    var menu:BoaMenu!
    var step:Int!
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var stepLabel: UILabel!
    
    
    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        step = 0
        createMenu()
    }
    
    func createMenu(){
        menu = BoaMenu.StepMenu(target: self, backImage: #imageLiteral(resourceName: "left"), nextImage: #imageLiteral(resourceName: "right"))
        menu.setAction(to: menu.buttons.first!, selector: #selector(back))
        menu.setAction(to: menu.buttons.last!, selector: #selector(forward))
    }
    
    
    //MARK: - Selectors
    @objc func back(){
        if step == 0{
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        defer {
            step = step - 1
        }
        
        if step == 1{
            stepLabel.text = "Start of steps"
            return
        }
        stepLabel.text = "We are in step \(step!)"
    }
    
    @objc func forward(){
        if step < 10{
            step = step + 1
            stepLabel.text = "We are in step \(step!)"
        }
        else{
            stepLabel.text = "End of steps"
        }
        
    }

}
