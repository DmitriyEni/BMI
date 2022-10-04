//
//  WeightViewController.swift
//  22_BMI
//
//  Created by Dmitriy Eni on 22.04.2022.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var wieghtLabel: UILabel!
    @IBOutlet weak var hieghtField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 15
        calculateButton.backgroundColor = customGreen
        barView.backgroundColor = customGreen
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func viewDidTap() {
        view.endEditing(true)
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        guard let age = ageField.text,
              let height = hieghtField.text
        else { return }
        guard let doubleAge = Double(age),
              let doubleHeight = Double(height) else {
                  wieghtLabel.textColor = .red
                  wieghtLabel.text = "НЕВЕРНЫЕ ДАННЫЕ"
                  return }
        
        let idealWieght = 50 + 0.75 * (doubleHeight - 150) + (doubleAge - 20) / 4
        let doubleIdealWieght = Double(round(idealWieght * 10) / 10)
        
        wieghtLabel.textColor = customGreen
        wieghtLabel.text = "ИДЕАЛЬНЫЙ ВЕС:\n\(doubleIdealWieght) кг."
        view.endEditing(true)
    }
}
