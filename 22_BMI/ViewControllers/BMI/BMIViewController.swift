//
//  BMIViewController.swift
//  22_BMI
//
//  Created by Dmitriy Eni on 22.04.2022.
//

import UIKit

let customGreen = UIColor(displayP3Red: 7/255, green: 153/255, blue: 0/255, alpha: 1.0)
let customGreenAlpha = UIColor(displayP3Red: 208/255, green: 233/255, blue: 220/255, alpha: 1.0)
let customRedAlpha = UIColor(red: 255/255, green: 201/255, blue: 201/255, alpha: 1.0)
let customOrangeAlpha = UIColor(red: 255/255, green: 228/255, blue: 204/255, alpha: 1.0)
let customIndigoAlpha = UIColor(red: 184/255, green: 184/255, blue: 211/255, alpha: 1.0)

class BMIViewController: UIViewController {
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var windowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = customGreenAlpha
        windowView.backgroundColor = customGreenAlpha
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(tap)
        calculateButton.layer.cornerRadius = 15
        calculateButton.backgroundColor = customGreen
        barView.backgroundColor = customGreen
    }
    
    @objc func viewDidTap() {
        view.endEditing(true)
    }
    
    @IBAction func calculatButtonAction(_ sender: Any) {
        guard let weight = weightField.text,
              let height = heightField.text
        else { return }
        guard let doubWeight = Double(weight),
              let doubHeight = Double(height) else {
                  messageLabel.textColor = .red
                  messageLabel.text = "НЕВЕРНЫЕ ДАННЫЕ"
                  return }
        let indexCount = doubWeight / ((doubHeight / 100) * (doubHeight / 100))
        let indexValue = Double(round(indexCount * 10) / 10)
        
        switch indexValue {
        case 0..<18,5:
            messageLabel.textColor = .systemIndigo
            calculateButton.backgroundColor = .systemIndigo
            self.view.backgroundColor = customIndigoAlpha
            windowView.backgroundColor = customIndigoAlpha
            barView.backgroundColor = .systemIndigo
            messageLabel.text = "ИМТ: \(indexValue)\nДефецит массы"
            
        case 18,5...25:
            messageLabel.textColor = customGreen
            calculateButton.backgroundColor = customGreen
            self.view.backgroundColor = customGreenAlpha
            windowView.backgroundColor = customGreenAlpha
            barView.backgroundColor = customGreen
            messageLabel.text = "ИМТ: \(indexValue)\nМасса в норме"
            
        case 25..<35:
            messageLabel.textColor = .orange
            calculateButton.backgroundColor = .orange
            self.view.backgroundColor = customOrangeAlpha
            windowView.backgroundColor = customOrangeAlpha
            barView.backgroundColor = .orange
            messageLabel.text = "ИМТ: \(indexValue)\nОжирение"
            
        default:
            messageLabel.textColor = .red
            calculateButton.backgroundColor = .red
            self.view.backgroundColor = customRedAlpha
            windowView.backgroundColor = customRedAlpha
            barView.backgroundColor = .red
            messageLabel.text = "ИМТ: \(indexValue)\nКрайняя степень ожирения"
        }
        view.endEditing(true)
    }
}
