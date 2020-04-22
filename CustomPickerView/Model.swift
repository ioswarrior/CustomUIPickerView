//
//  Model.swift
//  CustomPickerView
//
//  Created by iOS Warrior on 22.04.2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import Foundation

struct Brand {
    var id: Int
    var name: String
}

struct Model {
    var id: Int
    var brand_id: Int
    var name: String
}


class ModelData {
    
    var brands = [Brand]()
    var models = [Model]()
    var modelsByBrand = [Model]()
    
    init() {
        setupData()
    }
    
    func setupData() {
        let brand1 = Brand(id: 1, name: "Mercedes")
        let brand2 = Brand(id: 2, name: "Toyota")
        let brand3 = Brand(id: 3, name: "Ford")
        
        brands.append(brand1)
        brands.append(brand2)
        brands.append(brand3)
        
        let model1 = Model(id: 1, brand_id: 1, name: "S600")
        let model2 = Model(id: 2, brand_id: 1, name: "E200")
        let model3 = Model(id: 3, brand_id: 1, name: "C180")
        
        models.append(model1)
        models.append(model2)
        models.append(model3)
        
        let model21 = Model(id: 1, brand_id: 2, name: "Corolla")
        let model22 = Model(id: 2, brand_id: 2, name: "RAV 4")
        let model23 = Model(id: 3, brand_id: 2, name: "Camry 70")
        
        models.append(model21)
        models.append(model22)
        models.append(model23)
        
        let model31 = Model(id: 1, brand_id: 3, name: "Mustang")
        let model32 = Model(id: 2, brand_id: 3, name: "Fusion")
        let model33 = Model(id: 3, brand_id: 3, name: "Explorer")
        
        models.append(model31)
        models.append(model32)
        models.append(model33)
        
        self.modelsByBrand = getModels(brand_id: brands.first!.id)
    }
    
    // Метод который получает нужные модели по бренду
    func getModels(brand_id: Int) -> [Model] {
        let models = self.models.filter { (m) -> Bool in
            m.brand_id == brand_id
        }
        return models
    }
}
