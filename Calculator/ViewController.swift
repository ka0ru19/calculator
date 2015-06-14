//
//  ViewController.swift
//  Calculator
//
//  Created by 井上航 on 2015/06/14.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num:Int = 0
    var st: Int = 0
    var operation:Int = 0
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
    private func renewal(btnum:Int){
        if operation == 5 {
            mainlabel.text = String("\(num) (ERR:Choice ope)")
        }else{
            if st != 0 {
                st = st * 10
            }
            st += btnum
            mainlabel.text = String(st)
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
        } else if operation == 5 {
            //do nothing 次は必ず演算子
        }
    }
    
    
    @IBAction func bt3() {
        renewal(3)
    }
    @IBAction func bt4() {
        renewal(4)
    }
    
    @IBAction func plus() { // tag -> 1
        if operation != 5 {
            clc()
        }
        mainlabel.text = String("\(num) +")
        st = 0
        operation = 1
    }
    @IBAction func minus() {
        if operation != 5 {
            clc()
        }
        mainlabel.text = String("\(num) -")
        st = 0
        operation = 2
    }
    @IBAction func btac() {
        st = 0
        num = 0
        operation = 0 //初期化
        mainlabel.text = String(num)
    }
    @IBAction func btclc() { //「=」ボタン
        clc()
        operation = 5 //追加演算の準備
        mainlabel.text = String("= \(num)")
        
    }

}

