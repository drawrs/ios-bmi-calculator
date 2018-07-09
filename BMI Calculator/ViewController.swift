//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rizal Hilman on 09/07/18.
//  Copyright © 2018 Rizal Hilman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK : Categorizer
    var categorizer = BMICategorizer()
    
    // MARK : Labels
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var labelWeightPoint: UILabel!
    @IBOutlet weak var labelHeightPoint: UILabel!
    @IBOutlet weak var labelBMIResult: UILabel!
    
    @IBOutlet weak var labelSummary: UILabel!
    // MARK : View elements
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var segmentTheme: UISegmentedControl!
    @IBOutlet weak var imageBMI: UIImageView!
    
    // MARK : Slider
    @IBOutlet weak var sliderWeight: UISlider!
    @IBOutlet weak var sliderHeight: UISlider!
    
    // MARK : Define variable
    var weight: Float = 80.0
    var height: Float = 1.8
    var image: UIImage = #imageLiteral(resourceName: "normal")
    var bmi: Float {
        return weight / (height * height)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderWeight.value = weight
        sliderHeight.value = height
        imageBMI.image = image
        // do Counting
        doCalculate()
    }
    func doCalculate() {
        if weight > 1 && height > 0 {
            // do calclutate
            self.labelWeightPoint.text = String(format: "%.1f", weight)
            self.labelHeightPoint.text = String(format: "%.1f", height)
            self.labelBMIResult.text = String(format: "%.1f", bmi)
            
            if let category = categorizer.checkCategory(bmi: self.bmi) {
                self.labelSummary.text = category.categoryTitle
                self.labelSummary.textColor = category.categoryColor
                // image
                self.imageBMI.image = category.image
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentThemeChanged(_ sender: Any) {
        switch segmentTheme.selectedSegmentIndex {
        case 0:
            lightMode()
        case 1:
            darkMode()
        default:
            darkMode()
        }
    }
    
    @IBAction func sliderWeightChanged(_ sender: Any) {
        weight = sliderWeight.value
        
        print(weight)
        // calcluate
        doCalculate()
    }
    @IBAction func sliderHeihgtChanged(_ sender: Any) {
        height = sliderHeight.value
        
        print(height)
        // calculate
        doCalculate()
    }
    func darkMode() {
        mainView.backgroundColor = UIColor.black
        // change all labels text color to white
        for label in labels {
            label.textColor = UIColor.white
        }
    }
    func lightMode() {
        mainView.backgroundColor = UIColor.white
        // change all labels text color to black
        for label in labels {
            label.textColor = UIColor.black
        }
    }
}

