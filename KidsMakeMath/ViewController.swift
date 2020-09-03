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
        
        buildOperatorButton(btn: btnPlus, title: "➕")
        buildOperatorButton(btn: btnMinus, title: "➖")
        buildOperatorButton(btn: btnTimes, title: "✖️")
        buildOperatorButton(btn: btnDivision, title: "➗")
        buildOperatorButton(btn: btnDecimal, title: "⏺")
        buildOperatorButton(btn: btnClean, title: "🔙")
        buildOperatorButton(btn: btnPercent, title: "💯")
        buildOperatorButton(btn: btnInvert, title: "❗️")
        buildOperatorButton(btn: btnSqrt, title: "✔️")
        buildOperatorButton(btn: btnResult, title: "󠀽󠀽⏸")
        
        btnResult.transform = btnResult.transform.rotated(by: CGFloat(Double.pi / 2))
        
        buildNumberButton(btn: btn0, tag: 0, title: "0️⃣")
        buildNumberButton(btn: btn1, tag: 1, title: "1️⃣")
        buildNumberButton(btn: btn2, tag: 2, title: "2️⃣")
        buildNumberButton(btn: btn3, tag: 3, title: "3️⃣")
        buildNumberButton(btn: btn4, tag: 4, title: "4️⃣")
        buildNumberButton(btn: btn5, tag: 5, title: "5️⃣")
        buildNumberButton(btn: btn6, tag: 6, title: "6️⃣")
        buildNumberButton(btn: btn7, tag: 7, title: "7️⃣")
        buildNumberButton(btn: btn8, tag: 8, title: "8️⃣")
        buildNumberButton(btn: btn9, tag: 9, title: "9️⃣")
    }
    
    func buildNumberButton (btn: UIButton, tag: Int, title: String) {
       btn.tag = tag
       btn.setTitle(title, for: .normal)
       btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
       btn.backgroundColor = UIColor.white
    }
    
    func buildOperatorButton (btn: UIButton, title: String) {
       btn.setTitle(title, for: .normal)
       btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeButton)
       btn.backgroundColor = UIColor.white
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
