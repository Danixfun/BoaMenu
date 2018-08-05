//
//
//  Created by Daniel Tejeda on 22/02/18.
//  Copyright © 2018 Daniel Tejeda. All rights reserved.
//

import Foundation
import UIKit

/*
 
 Please, remember:
 BoaMenuTemplate = Aesthetics (position, number of buttons, color, etc)
 BoaMenu = Behavior (components, events, animations, etc)
 
 */


struct BoaMenuTemplate {
    var frame:CGRect!
    var backgroundColor:UIColor!
    var buttonSize:CGSize!//The size for each button
    var numberOfButtons:Int!
    var initialButtonY: CGFloat!//Default vertical position for buttons
    var initialButtonX: CGFloat!//Default horizontal position for buttons (Use this to handle button positions)
    var icons:[UIImage]!//The icons for buttons
    
    //Explicit menu
    init(frame:CGRect, backgroundColor:UIColor, numberOfButtons:Int, buttonSize:CGSize) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.numberOfButtons = numberOfButtons
        self.buttonSize = buttonSize
        initialButtonY = 0
        initialButtonX = 0
    }
    
    //If buttonSize is not given, we must calcute it using the numberOfButtons property
    init(frame:CGRect, backgroundColor:UIColor, numberOfButtons:Int){
        let size = CGSize(width: frame.width/CGFloat(numberOfButtons), height: frame.height)
        self.init(frame:frame, backgroundColor:backgroundColor, numberOfButtons:numberOfButtons, buttonSize:size)
    }
    
}



class BoaMenu:UIView{
    
    //MARK: - Properties
    var template:BoaMenuTemplate!//Options
    var buttons = [UIButton]()//Array that contains our buttons
    var firstButton:UIButton!
    var lastButton:UIButton!
    var target:UIViewController!
    
    
    //MARK: - Initialization
    init(template:BoaMenuTemplate) {
        super.init(frame: template.frame)
        self.template = template
        self.backgroundColor = template.backgroundColor
        
        //Helpers
        let buttonHeight = template.buttonSize.height
        let buttonWidth = template.buttonSize.width
        var nextX:CGFloat! = template.initialButtonX
        let nextY:CGFloat! = template.initialButtonY
        
        //Create "n" default buttons
        if template.numberOfButtons > 0{
            for _ in 0..<template.numberOfButtons{
                let newButton = UIButton(frame: CGRect(x: nextX, y: nextY, width: buttonWidth, height: buttonHeight))
                buttons.append(newButton)
                nextX = nextX + buttonWidth//Update X positions, that way we prevent buttons from colliding
                self.addSubview(newButton)//Add button to view
            }
            //Set other properties
            firstButton = buttons.first
            lastButton = buttons.last
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Button icons
    func setIcon(index i:Int, imageName:String){
        setIcon(index: i, image: UIImage(named:imageName)!, state: .normal)
    }
    
    func setIcon(index i:Int, imageName:String, state:UIControlState){
        setIcon(index: i, image: UIImage(named:imageName)!, state: state)
    }
    
    func setIcon(index i:Int, image:UIImage?){
        setIcon(index: i, image: image, state: .normal)
    }
    
    func setIcon(index i:Int, image:UIImage? = nil, state:UIControlState){
        buttons[i].setImage(image, for: state)
    }
    
    func setIcons(_ imagesNames:[String]){
        for i in 0..<buttons.count{
            //Check if the image name actually exists.
            let imageName:String? = imagesNames[i]
            if let name = imageName{
                setIcon(index: i, imageName: name)
                continue
            }
            break;
        }
    }
    
    
    
    //MARK: - Events
    func setAction(withIndex i:Int, selector:Selector, event:UIControlEvents){
        setAction(to: buttons[i], selector: selector)
    }
    
    func setAction(to b:UIButton, selector:Selector, event:UIControlEvents){
        setAction(to: b, selector: selector)
    }
    
    func setAction(withIndex i:Int, selector:Selector){
        setAction(to: buttons[i], selector: selector)
    }
    
    func setAction(to b:UIButton, selector:Selector){
        b.addTarget(target, action: selector, for: .touchUpInside)
    }
    
}



//Add your templates here.
extension BoaMenu{
    
    //Returns a five buttons menu with a white background. This function adds the menu to its target.
    static func DefaultMenu(target:UIViewController)->BoaMenu{
        let template = BoaMenuTemplate(frame: BoaMenuTemplate.defaultBoaMenuBottomFrame(target: target), backgroundColor: .white, numberOfButtons: 5)
        let m = BoaMenu(template: template)
        m.target = target
        target.view.addSubview(m)
        return m
    }
    
    //Returns a menu with a "back" button and a "next" button. Back button on the left corner whereas Next button on the right corner.
    static func StepMenu(target:UIViewController, backImage:UIImage, nextImage:UIImage)->BoaMenu{
        let template = BoaMenuTemplate(frame: BoaMenuTemplate.defaultBoaMenuBottomFrame(target: target), backgroundColor: .white, numberOfButtons: 5)
        let m = BoaMenu(template: template)
        m.target = target
        target.view.addSubview(m)
        m.setIcon(index: 0, image: backImage)
        m.setIcon(index: m.buttons.count-1, image: nextImage)
        return m
    }
    
    //Use this func to create a custom menu
    static func WithTemplate(template:BoaMenuTemplate, target:UIViewController)->BoaMenu{
        let m = BoaMenu(template: template)
        m.target = target
        target.view.addSubview(m)
        return m
    }
    
}


//Add default frames here.
extension BoaMenuTemplate{
    
    static var defaultBoaMenuHeight:CGFloat = 49.0
    
    static func defaultBoaMenuBottomFrame(target:UIViewController)->CGRect{
        let upperViewFrame = target.view.frame
        return CGRect(x: 0, y: upperViewFrame.height-defaultBoaMenuHeight, width: upperViewFrame.width, height: defaultBoaMenuHeight)
    }
    
    static func defaultBoaMenuTopFrame(target:UIViewController)->CGRect{
        let upperViewFrame = target.view.frame
        return CGRect(x: 0, y: 20, width: upperViewFrame.width, height: defaultBoaMenuHeight)
    }
    
}







