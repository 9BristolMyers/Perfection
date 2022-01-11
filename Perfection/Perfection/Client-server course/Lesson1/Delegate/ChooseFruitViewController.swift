//
//  ChooseFruitViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation

protocol FruitsViewControllerDelegate: AnyObject {
    
    func alphabetChosen(alphabet: String)
}

class ChooseFruitViewController: UITableViewController {
    
    let alphabet = ["Apple", "Orange", "Banana", "Grape"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alphabets.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        
        cell.textLabel?.text = alphabets[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alphabet = alphabets[indexPath.row]
        
        delegate?.alphabetChosen(alphabet: alphabet)
        
        navigationController?.popViewController(animated: true)
    }
}
