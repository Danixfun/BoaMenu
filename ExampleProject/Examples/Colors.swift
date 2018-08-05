//
//  ViewController.swift
/*
 
 Simple BoaMenu
This example shows a white BoaMenu with 5 buttons. Each button has its own selector and image.
 
 */
import UIKit

class Colors: UIViewController {
    
    //MARK: - Properties
    var menu:BoaMenu!
    
    //MARK: - IBOutlet
    @IBOutlet weak var backButton: UIButton!
    
    //MARK: - IBAction
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //We create a menu using the default template
        menu = BoaMenu.DefaultMenu(target: self)
        
        //We add the icons for each button.
        //You can also use setIcons(imagesNames: [String]) to save a few lines of code.
        menu.setIcon(index: 0, image: #imageLiteral(resourceName: "black"))
        menu.setIcon(index: 1, image: #imageLiteral(resourceName: "pink"))
        menu.setIcon(index: 2, image: #imageLiteral(resourceName: "green"))
        menu.setIcon(index: 3, image: #imageLiteral(resourceName: "orange"))
        menu.setIcon(index: 4, image: #imageLiteral(resourceName: "blue"))
        
        
        //We set the actions for each button.
        //Remember that setAction() uses the touchUpInsideEvent as default.
        //Call setAction() with the UIControlEvents parameter if you want to perform custom events.
        menu.setAction(withIndex: 0, selector: #selector(selector1))
        menu.setAction(withIndex: 1, selector: #selector(selector2))
        menu.setAction(withIndex: 2, selector: #selector(selector3))
        menu.setAction(withIndex: 3, selector: #selector(selector4))
        menu.setAction(withIndex: 4, selector: #selector(selector5))
        
    }
    
    //MARK: - Selectors
    @objc func selector1(){
        view.backgroundColor = .black
    }
    @objc func selector2(){
        view.backgroundColor = .purple
    }
    @objc func selector3(){
        view.backgroundColor = .green
    }
    @objc func selector4(){
        view.backgroundColor = .orange
    }
    @objc func selector5(){
       view.backgroundColor = .blue
    }
    
}

