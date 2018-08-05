//
//  Animation.swift
//  ExampleProject
//
//  Created by Daniel Tejeda on 05/08/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

class Animation: UIViewController {
    
    //MARK: - Properties
    var menu:BoaMenu!
    var isDown:Bool = true
    
    //MARK: - IBAction
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
    }
    
    func setupMenu(){
        menu = BoaMenu.DefaultMenu(target: self)
        menu.backgroundColor = .blue
        menu.setIcons(["up","down","orange","blue","star"])
        menu.setAction(withIndex: 0, selector: #selector(upAni))
        menu.setAction(withIndex: 1, selector: #selector(downAni))
        menu.setAction(withIndex: 2, selector: #selector(orangeAni))
        menu.setAction(withIndex: 3, selector: #selector(blueAni))
        menu.setAction(withIndex: 4, selector: #selector(starAni))
    }
    
    
    //MARK: - Selectors - I like to do copy n paste.
    @objc func upAni(){
        if isDown{
            isDown = false
            menu.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.menu.center.y -= 100
            }, completion: {(b)->Void in
                self.menu.isUserInteractionEnabled = true
            })
        }
    }
    
    @objc func downAni(){
        if !isDown{
            isDown = true
            menu.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.menu.center.y += 100
            }, completion: {(b)->Void in
                self.menu.isUserInteractionEnabled = true
            })
        }
    }
    
    @objc func orangeAni(){
        UIView.animate(withDuration: 0.3, animations: {()->Void in
            self.menu.alpha = 0.0
        }, completion: {(b)->Void in
            self.menu.backgroundColor = .orange
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.menu.alpha = 1.0
            }, completion: {(b)->Void in
            })
        })
    }
    
    @objc func blueAni(){
        UIView.animate(withDuration: 0.3, animations: {()->Void in
            self.menu.alpha = 0.0
        }, completion: {(b)->Void in
            self.menu.backgroundColor = .blue
            UIView.animate(withDuration: 0.3, animations: {()->Void in
                self.menu.alpha = 1.0
            }, completion: {(b)->Void in
            })
        })
    }
    
    @objc func starAni(){
        for b in menu.buttons{
            b.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .allowUserInteraction,animations: {()->Void in
                b.transform = .identity
            },completion: nil)
        }
    }

   
}
