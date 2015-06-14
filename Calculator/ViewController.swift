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
    /*private func clc(n: Int, s: Int, op: Int)->Int{
        if op == 1 {
            n += s
        }
        else if op == 2{
            self.n -= self.s
        }
        self.s = 0
        
    }
*/
    
    
    @IBAction func bt3() {
        if st != 0 {
            st = st * 10
        }
        st += 3
        mainlabel.text = String(st)
    }
    @IBAction func bt4() {
        if st != 0 {
            st = st * 10
        }
        st += 4
        mainlabel.text = String(st)
    }
    
    @IBAction func plus() { // tag -> 1
        operation = 1
        num = st
        st = 0
    }
    @IBAction func minus() {
        operation = 2
        num = st
        st = 0
    }
    @IBAction func btac() {
        num = 0
        operation = 0 //初期化
        mainlabel.text = String(num)
    }
    @IBAction func btclc() { //「=」ボタン
        if operation == 1 {
            num += st
        }
        else if operation == 2{
            num -= st
        }
        st = 0
        operation = 0 //初期化
        mainlabel.text = String(num)
        
    }

}

