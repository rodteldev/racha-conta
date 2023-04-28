//
//  ViewController.swift
//  RachaConta
//
//  Created by Rodrigo Telles on 13/04/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
//    Variáveis: numberOfPeople - pessoas mínimas para divisão
//    tip - gorjeta com valor iniciado
//    billTotal - total conta com valor iniciado
    var numberOfPeople = 2
    var tip = 0.10
    var billTotal = 0.0
    var finalResult = "0.0"
//    Escolha de porcentagem da gorjeta
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        switch true {
        case zeroPercentButton.isSelected:
            tip = 0.0
        case tenPercentButton.isSelected:
            tip = 0.1
        case twentyPercentButton.isSelected:
            tip = 0.2
        default:
            tip = 0.0
        }
    }
//    Número de pessoas para dividir usando o Stepper
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
//    Calcular total
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill) ?? 0
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
//    Resultados aparecem para a tela Results
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
            
    }
    
}

