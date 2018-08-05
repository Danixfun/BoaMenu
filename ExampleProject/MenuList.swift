//
//  MenuList.swift
//  ExampleProject
//
//  Created by Daniel Tejeda on 04/08/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

class MenuList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    let names = ["Default Menu","Step Menu","Custom Template","Multiple Menus","Animation Example"]
    let ids = ["Colors","Form","Custom","Multiple","Animation"]
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!{
        didSet{ //I sometimes do weird stuff.
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regularCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openView(withId: ids[indexPath.row])
    }
    
    
    //MARK: - Utils
    func openView(withId id:String){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: id)
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }

}
