//
//  ViewController.swift
//  test1
//
//  Created by 李如昀 on 2019/3/13.
//  Copyright © 2019 李如昀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FlipcountLabel: UILabel!
    @IBOutlet var cardBtns: [UIButton]!
    
    var emoji = ["🌛","🌜","🌚","🌕","🌖","🌗","🌘","🌑","🌒","🌓","🌔","🌙","🌎","🌍","🌏","🌝"]
    
    
    var Flipcount:Int = 0 {
        
        didSet{
            FlipcountLabel.text = "Flips:\( Flipcount )"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touchCardBtn(_ sender: UIButton) {
        if let cardNumber = cardBtns.index(of: sender) {
            print("cardNumber = \(String(describing: cardNumber))")
            flipCard(withEmoji: emoji[cardNumber], on: sender)
        }else {
            print("Not in the collection")
        }
        Flipcount += 1
    }
    
    @IBAction func FlipAllBtn(_ sender: Any) {
//        random()
        flipAll(withEmoji: emoji, on: cardBtns)
    }
    
   
    @IBAction func Reser(_ sender: Any) {
        Flipcount = 0
        
        ResetCard(withEmoji: emoji, on: cardBtns)
        
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
//    func flipAll(withEmoji emoji: String, on buttons: [UIButton]!) {
//        for i in buttons {
//                //                print("\(j)")
//                if i.currentTitle == emoji {
//                    i.setTitle("", for: UIControl.State.normal)
//                    i.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//                } else {
//                    i.setTitle(emoji, for: UIControl.State.normal)
//                    i.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                    //                print("\(j)")
//                }
//        }
//
//    }
//
    func flipAll(withEmoji emoji: [String], on buttons: [UIButton]!) -> Int {
        for i in buttons {
            let random = Int.random(in: 0..<emoji.count)
            
                if i.currentTitle == emoji[random] {
                    i.setTitle(emoji[random], for: UIControl.State.normal)
                    i.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                } else {
                    i.setTitle(emoji[random], for: UIControl.State.normal)
                    i.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
        
        Flipcount += 16
        return emoji.count
        
    }
    
    
    func ResetCard(withEmoji emoji: [String], on button: [UIButton]) {
        for i in button {
            for j in emoji{
                if i.currentTitle == j {
                    i.setTitle(j, for: UIControl.State.normal)
                    i.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }else {
                    i.setTitle("", for: UIControl.State.normal)
                    i.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
            
            }
        }
        
    }
    
    func random() {
        let idol = emoji.randomElement()
        let button = cardBtns.randomElement()
        
        if button!.currentTitle == idol! {
            button!.setTitle("", for: UIControl.State.normal)
            button!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else {
            button!.setTitle(idol!, for: UIControl.State.normal)
            button!.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }

}

