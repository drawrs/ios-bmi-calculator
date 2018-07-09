//
//  BMICategorizer.swift
//  BMI Calculator
//
//  Created by Rizal Hilman on 09/07/18.
//  Copyright © 2018 Rizal Hilman. All rights reserved.
//

import Foundation
import UIKit

struct WeightCategory {
    let minBMI: Float
    let maxBMI: Float
    let categoryTitle: String
    let categoryColor: UIColor
    let image: UIImage
    
}


struct BMICategorizer {
    let weightCategories: [WeightCategory] = [
        WeightCategory(minBMI: 0, maxBMI: 18, categoryTitle: "Underwight", categoryColor: UIColor.red, image: #imageLiteral(resourceName: "underweight")),
        WeightCategory(minBMI: 18, maxBMI: 25, categoryTitle: "Normal", categoryColor: UIColor.green, image: #imageLiteral(resourceName: "normal")),
        WeightCategory(minBMI: 25, maxBMI: 30, categoryTitle: "Overweight", categoryColor: UIColor.orange, image: #imageLiteral(resourceName: "overweight")),
        WeightCategory(minBMI: 30, maxBMI: 35, categoryTitle: "Moderately obese", categoryColor: UIColor.blue, image: #imageLiteral(resourceName: "overweight")),
        WeightCategory(minBMI: 18, maxBMI: 40, categoryTitle: "Severely obese", categoryColor: UIColor.purple, image: #imageLiteral(resourceName: "obsese")),
        WeightCategory(minBMI: 40, maxBMI: 1000, categoryTitle: "Very severely obese", categoryColor: UIColor.brown, image: #imageLiteral(resourceName: "obsese"))
        ]
    
    func checkCategory(bmi: Float) -> WeightCategory? {
        var matchedCategory: WeightCategory? = nil
        
        for category in weightCategories {
            if bmi >= category.minBMI && bmi < category.maxBMI {
                matchedCategory = category
                break
            }
        }
        return matchedCategory
    }
    
}
