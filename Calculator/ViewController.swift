//
//  ViewController.swift
//  Calculator
//
//  Created by 井上航 on 2015/06/14.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num:Float = 0
    var st: Float = 0
    var operation:Int = 0
    var floatdisplay:Bool = false //小数表示するか否か true -> する
    var addstr:String = ""
    var historystr:String = ""
    
    @IBOutlet weak var historyText: UITextView! //履歴
    @IBOutlet weak var mainlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //番号ボタンが押された時のlabel更新
    private func renewal(btnum:Float){
        //演算子を選択していないとエラーメッセージを表示
        if operation == 5 {
            mainlabel.text = String(format: "%.f (ERR:Choice Ope)",num)
        }else{
            if st != 0 {
                st = st * 10
            }
            st += btnum
            mainlabel.text = String(format: "%.f", st)
            
            addstr = String(format: "%.f ", st)
            historystr += addstr
            historyText.text =  historyText.text + String(format: "%.f", btnum) //履歴に数字を追加
        }
    }
    
    // 演算の実行
    private func clc(){
        if operation == 0 {
            num = st
        } else if operation == 1 {
            num += st
        } else if operation == 2 {
            num -= st
        } else if operation == 3 {
            num *= st
        } else if operation == 5 {
            //do nothing 次は必ず演算子
        }
    }
    //演算子ボタンが押された時の動き
    private func pressope(x:Int){
        if operation != 5 {
            clc()
        }
        st = 0
        if operation != 0 { historyText.text = historyText.text + String(format: "%.f", num) }
        operation = x
    }
    
    @IBAction func bt0() { renewal(0) }
    @IBAction func bt1() { renewal(1) }
    @IBAction func bt2() { renewal(2) }
    @IBAction func bt3() { renewal(3) }
    @IBAction func bt4() { renewal(4) }
    @IBAction func bt5() { renewal(5) }
    @IBAction func bt6() { renewal(6) }
    @IBAction func bt7() { renewal(7) }
    @IBAction func bt8() { renewal(8) }
    @IBAction func bt9() { renewal(9) }
    
    @IBAction func plus() {
        pressope(1)
        mainlabel.text = String(format: "%.f +", num)
        historyText.text = historyText.text + String(" + ") //履歴に演算子を追加
    }
    @IBAction func minus() {
        pressope(2)
        mainlabel.text = String(format: "%.f -", num)
        historyText.text = historyText.text + String(" - ") //履歴に演算子を追加
    }
    @IBAction func multiply() {
        pressope(3)
        mainlabel.text = String(format: "%.f ×", num)
        historyText.text = historyText.text + " × " //履歴に演算子を追加

    }
    @IBAction func btac() {
        st = 0
        num = 0
        operation = 0 //初期化
        mainlabel.text = String(0)
        historyText.text = historyText.text + String("---AC---\n")

    }
    @IBAction func btclc() { //「=」ボタン
        clc()
        operation = 5 //追加演算の準備
        mainlabel.text = String(format: "= %.f", num)
        historyText.text = historyText.text + String(format: " = %.f \n", num) //履歴に演算子を追加
        
    }

}

