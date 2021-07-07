//
//  ViewController.swift
//  firstprojectTestPicker
//
//  Created by fedir on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //MARK: - properties
    
    let datePicker = UIDatePicker()
    let gendersArray = ["Male","Female","Unknown"]
    
    //MARK: - outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        setup()
    
    }
    
    
    
    //MARK: -   methods
    
    private func setup() {
        imageView.layer.cornerRadius = imageView.frame.height/2
        genderLabel.textColor = .blue
        genderPicker.isHidden = true
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: Date())
        datePicker.maximumDate = calendar.date(from: components)
        datePicker.addTarget(self, action: #selector(dateChanged) , for: .valueChanged)
    }
    
    
    @IBAction func genderButtonDidTap(_ sender: Any) {
        genderPicker.isHidden.toggle()
    }
    
    
    @objc func dateChanged() {
        getDataFropPicker()
        view.endEditing(true)
        
    }
    
    func getDataFropPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateTextField.text = "Date of birth: " + formatter.string(from: datePicker.date)
    }
    
    
}

extension ViewController: UIPickerViewDataSource , UIPickerViewDelegate {
    //MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gendersArray.count
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0: return gendersArray[row]
        case 1: return gendersArray[row]
        case 2: return gendersArray[row]
        default:  return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderLabel.text = gendersArray[row] + "  "
    }
    
     
}

