//
//  ViewController.swift
//  CustomPickerView
//
//  Created by iOS Warrior on 22.04.2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var modelData = ModelData()
    var selectedBrand: Brand?
    var selectedModel: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData.text = ""
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // Количество барабанов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Количество элементов
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return modelData.brands.count
        case 1:
            return modelData.modelsByBrand.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let brand = modelData.brands[row]
            return brand.name
        } else {
            let model = modelData.modelsByBrand[row]
            return model.name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let brand = modelData.brands[row]
            selectedBrand = brand
            modelData.modelsByBrand = modelData.getModels(brand_id: brand.id)
            pickerView.reloadComponent(1)
            // Скролл обратно на первый элемент
            pickerView.selectRow(0, inComponent: 1, animated: true)
            
            let model = self.modelData.modelsByBrand[0]
            selectedModel = model
            
            if let brand = selectedBrand, let model = selectedModel {
                labelData.text = "\(brand.name) \(model.name) "
            }
        } else {
            let model = self.modelData.modelsByBrand[row]
            selectedModel = model
            
            if let brand = selectedBrand, let model = selectedModel {
                labelData.text = "\(brand.name) \(model.name) "
            }
        }
    }
}

