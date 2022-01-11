//
//  FruitsStoreViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation

class FruitsStoreViewController: UIViewController, ChooseFruitViewControllerDelegate {

    @IBOutlet weak var alphabetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    @IBAction func chooseAlphabetAction(_ sender: Any) {
        
        let ChooseFruitContoller = ChooseFruitViewController()
        ChooseFruitContoller.delegate = self
        
        
        navigationController?.pushViewController(animated: true)
    }
    
    func alphabetChosen(_ String: alphabetAction) {
        self.alphabetLabel.text = alphabet
    }
}
