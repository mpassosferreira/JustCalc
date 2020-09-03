//
//  ViewController.swift
//  KidsMakeMath
//
//  Created by Marcio P Ferreira on 31/08/20.
//  Copyright © 2020 Passos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sizeButton: CGFloat = 70
    var total: Double = 0.0
    
    @IBOutlet weak var labelHello: UILabel!
        
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnTimes: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var btnResult: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnInvert: UIButton!
    @IBOutlet weak var btnClean: UIButton!
    @IBOutlet weak var btnSqrt: UIButton!
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    //var arrayExample = ["2.5", "+", "3.7", "=", "6.2"]
    var array = ["", "", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHello.font = UIFont.boldSystemFont(ofSize: 60.0)
        labelHello.layer.borderColor = UIColor.darkGray.cgColor
        labelHello.layer.borderWidth = 4.0
        labelHello.layer.cornerRadius = 10
        labelHello.text = "0"
        
        btnPlus.setTitle("➕", for: .normal)
        btnPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnPlus.backgroundColor = UIColor.white
        btnMinus.setTitle("➖", for: .normal)
        btnMinus.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnMinus.backgroundColor = UIColor.white
        btnTimes.setTitle("✖️", for: .normal)
        btnTimes.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnTimes.backgroundColor = UIColor.white
        btnDivision.setTitle("➗", for: .normal)
        btnDivision.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnDivision.backgroundColor = UIColor.white
        
        btnDecimal.setTitle("⏺", for: .normal)
        btnDecimal.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnDecimal.backgroundColor = UIColor.white
        btnPercent.setTitle("💯", for: .normal)
        btnPercent.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnPercent.backgroundColor = UIColor.white
        btnInvert.setTitle("❗️", for: .normal)
        btnInvert.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnInvert.backgroundColor = UIColor.white
        btnClean.setTitle("🔙", for: .normal)
        btnClean.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnClean.backgroundColor = UIColor.white
        btnSqrt.setTitle("✔️", for: .normal)
        btnSqrt.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnSqrt.backgroundColor = UIColor.white
        btnResult.setTitle("󠀽󠀽⏸", for: .normal)
        btnResult.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btnResult.backgroundColor = UIColor.white
        btnResult.transform = btnResult.transform.rotated(by: CGFloat(Double.pi / 2))
        
        btn0.tag = 0
        btn0.setTitle("0️⃣", for: .normal)
        btn0.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn0.backgroundColor = UIColor.white
        btn1.tag = 1
        btn1.setTitle("1️⃣", for: .normal)
        btn1.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn1.backgroundColor = UIColor.white
        btn2.tag = 2
        btn2.setTitle("2️⃣", for: .normal)
        btn2.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn2.backgroundColor = UIColor.white
        btn3.tag = 3
        btn3.setTitle("3️⃣", for: .normal)
        btn3.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn3.backgroundColor = UIColor.white
        btn4.tag = 4
        btn4.setTitle("4️⃣", for: .normal)
        btn4.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn4.backgroundColor = UIColor.white
        btn5.tag = 5
        btn5.setTitle("5️⃣", for: .normal)
        btn5.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn5.backgroundColor = UIColor.white
        btn6.tag = 6
        btn6.setTitle("6️⃣", for: .normal)
        btn6.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn6.backgroundColor = UIColor.white
        btn7.tag = 7
        btn7.setTitle("7️⃣", for: .normal)
        btn7.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn7.backgroundColor = UIColor.white
        btn8.tag = 8
        btn8.setTitle("8️⃣", for: .normal)
        btn8.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn8.backgroundColor = UIColor.white
        btn9.tag = 9
        btn9.setTitle("9️⃣", for: .normal)
        btn9.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
        btn9.backgroundColor = UIColor.white
    }
    
    func setLabel (values: [String]) {
       labelHello.text =  "\(values[0])\(values[1])\(values[2])\(values[3])\(values[4])"
    }
    
    @IBAction func setNumber(_ sender: UIButton) {
        prepareData(value: String(sender.tag))
    }
    
    @IBAction func actionPlus(_ sender: Any) {
        prepareOperation(operation: "+")
    }
    
    @IBAction func actionMinus(_ sender: Any) {
        prepareOperation(operation: "-")
    }
    
    @IBAction func actionTimes(_ sender: Any) {
        prepareOperation(operation: "x")
    }
    
    @IBAction func actionDivision(_ sender: Any) {
        prepareOperation(operation: "/")
    }
    
    @IBAction func actionPercent(_ sender: Any) {
        applyPercent()
    }
    
    @IBAction func actionChangeSignal(_ sender: Any) {
        actionChangeSignal()
    }
    
    @IBAction func actionApplyDecimal(_ sender: Any) {
        applyDecimal()
    }
    
    @IBAction func actionSqrt(_ sender: Any) {
        applySqrt()
    }
    
    @IBAction func actionClean(_ sender: Any) {
        for i in 0 ..< array.count {
            array[i] = ""
        }
        setLabel(values: array)
        labelHello.text = "0"
    }
    
    func prepareData (value: String) {
        initializeLabel()
        if array[1] == "" {
            array[0] = array[0] + value
        } else {
            array[2] = array[2] + value
        }
        setLabel(values: array)
    }
    
    func prepareOperation (operation: String) {
        if array[0] != "", array[2] == "" {
            array[1] = operation
            let isInteger = floor(Double(array[0])!) == Double(array[0])!
            array[0] = isInteger ? String(Int(Double(array[0])!)) : String(array[0])
            setLabel(values: array)
        }
    }
    
    func applySqrt() {
        if let value = Double(array[0]), array[2] == "" {
            let isInt = floor(value) == value
            let result = isInt ? sqrt(value) : Double(array[0])
            let isInteger = floor(result!) == result
            array[0] = isInteger ? String(Int(result!)) : String(result!)
        }
        setLabel(values: array)
    }
    
    func applyPercent() {
        if let value1 = Double(array[0]), array[2] == "" {
            let result = value1 / 100
            let isInteger = floor(result) == result
            array[0] = isInteger ? String(Int(result)) : String(result)
        }
        setLabel(values: array)
    }
    
    func actionChangeSignal() {
        if let value1 = Double(array[0]), array[2] == "" {
            let result = value1 * -1
            let isInteger = floor(result) == result
            array[0] = isInteger ? String(Int(result)) : String(result)
        }
        setLabel(values: array)
    }
    
    func applyDecimal() {
        if array[1] == "" {
            array[0] = array[0] == "" ? array[0] + "0." : array[0] + "."
        } else {
            array[2] = array[2] == "" ? array[2] + "0." : array[2] + "."
        }
        setLabel(values: array)
    }
    
    func initializeLabel() {
        if array[4] != "" {
            for i in 0 ..< array.count {
               array[i] = ""
            }
        }
        setLabel(values: array)
    }
    
    @IBAction func actionExecute(_ sender: Any) {
        if let value1 = Double(array[0]), let value2 = Double(array[2]) {
            array[3] = "="
            
            let isInteger = floor(Double(array[2])!) == Double(array[2])!
            array[2] = isInteger ? String(Int(Double(array[2])!)) : String(array[2])
            
            let total = execute(value1, value2)
            let isInt = floor(total) == total
            array[4] = isInt ? String(Int(total)) : String(total)
            setLabel(values: array)
        }
    }
    
    func execute(_ value1: Double, _ value2: Double) -> Double {
        var result: Double
        if array[1] == "+" {
            result = value1 + value2
        } else {
            if array[1] == "-" {
                result = value1 - value2
            } else {
                if array[1] == "x" {
                    result = value1 * value2
                } else {
                    result = value1 / value2
                }
            }
        }
        return result
    }
    
}
