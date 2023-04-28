//
//  ResultsViewController.swift
//  RachaConta
//
//  Created by Rodrigo Telles on 14/04/23.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
//    Variáveis iniciadas
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Exibição de resultado
        totalLabel.text = result
        settingsLabel.text = "Dividido entre \(split) pessoas com \(tip)% de gorjeta"

    }
//    Retorna ao início
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
