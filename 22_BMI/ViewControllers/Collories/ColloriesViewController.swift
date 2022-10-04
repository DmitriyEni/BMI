//
//  ColloriesViewController.swift
//  22_BMI
//
//  Created by Dmitriy Eni on 22.04.2022.
//

import UIKit

class ColloriesViewController: UIViewController {
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var activityField: UITextField!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tabbarView: UIView!
    @IBOutlet weak var erorLabel: UILabel!
    
    private var gender = Gender.allCases
    private var genderPicker = UIPickerView()
    private var selectGender: Gender?
    
    private var activity = Activity.allCases
    private var activityPicker = UIPickerView()
    private var selectActivity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.alpha = 0
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderField.inputView = genderPicker
        
        activityPicker.dataSource = self
        activityPicker.delegate = self
        activityField.inputView = activityPicker
        
        calculateButton.layer.cornerRadius = 15
        calculateButton.backgroundColor = customGreen
        
        backButton.layer.cornerRadius = 15
        backButton.backgroundColor = customGreen
        
        centerView.backgroundColor = customGreenAlpha
        secondView.backgroundColor = customGreenAlpha
        tabbarView.backgroundColor = customGreen
        self.view.backgroundColor = customGreenAlpha
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func viewDidTap() {
        view.endEditing(true)
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        guard let height = heightField.text,
              let weight = weightField.text,
              let gender = selectGender?.indexValue,
              let age = ageField.text,
              let activity = selectActivity?.coefficient else {
                  erorLabel.isHidden = false
                  erorLabel.textColor = .red
                  erorLabel.text = "НЕВЕРНЫЕ ДЕННЫЕ"
                  return }
        guard let heightValue = Double(height),
              let weightValue = Double(weight),
              let ageValue = Double(age) else {
                  erorLabel.isHidden = false
                  erorLabel.textColor = .red
                  erorLabel.text = "НЕВЕРНЫЕ ДЕННЫЕ"
                  return }
        erorLabel.isHidden = true
        let normaCollories = ((10 * weightValue) + (6.25 * heightValue) - (5 * ageValue) + gender) * activity
        
        view.endEditing(true)
        
        UIView.animate(withDuration: 0.4) {
            self.centerView.alpha = 0
            self.secondView.alpha = 1
            self.view.layoutIfNeeded()
        }
        
        messageLabel.text = "Для похудения нужно потреблять:\n\(Int(normaCollories * 0.8)) калорий\n\nДля поддержания веса нужно потреблять:\n\(Int(normaCollories)) калорий\n\nДля набора массы нужно потреблять:\n\(Int(normaCollories * 1.2)) калорий"
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.centerView.alpha = 1
            self.secondView.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
}

extension ColloriesViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker:
            return gender.count
        case activityPicker:
            return activity.count
        default:
            return 0
        }
    }
}

extension ColloriesViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case genderPicker:
            return gender[row].rawValue
        case activityPicker:
            return activity[row].rawValue
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case genderPicker:
            genderField.text = gender[row].rawValue
            self.selectGender = gender[row]
        case activityPicker:
            activityField.text = activity[row].rawValue
            self.selectActivity = activity[row]
        default: break
        }
    }
}
