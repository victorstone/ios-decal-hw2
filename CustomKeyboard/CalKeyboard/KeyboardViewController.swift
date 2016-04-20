//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    //Control Buttons
    @IBOutlet weak var UpperCaseButton: UIButton!
    @IBOutlet weak var SelectBinaryButton: UIButton!
    @IBOutlet weak var SelectedHexButton: UIButton!
    @IBOutlet weak var BackSpaceButton: UIButton!

    //Letters
    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var x: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var v: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var n: UIButton!
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var space: UIButton!
    
    

    //For when we switch to uppercase
    let uppercaseASCII = ["A" : 65, "B" : 66, "C" : 67, "D" : 68, "E": 69, "F": 70, "G": 71, "H": 72, "I": 73, "J": 74, "K": 75, "L": 76, "M": 77, "N": 78, "O": 79, "P": 80, "Q": 81, "R": 82, "S": 83, "T": 84, "U": 85, "V": 86, "W": 87, "X": 88, "Y": 89, "Z": 90]
    //For when we transition into lowercase
    let lowercaseASCII = ["a" : 97, "b" : 98, "c" : 99, "d" : 100, "e" : 101, "f" : 102, "g" : 103, "h" : 104, "i" : 105, "j" : 106, "k" : 107, "l" : 108, "m" : 109, "n" : 110, "o" : 111, "p" : 112, "q" : 113, "r" : 114, "s" : 115, "t" : 116, "u" : 117, "v" : 118, "w" : 119, "x" : 120, "y" : 121, "z" : 122]
    //Change when changing case
    var isLowerCase = true

    //Binary or Hex, default to Binary
    var isBinary = true

    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func changeLetterCase() {
        //won't compile with large hard coded array for some reason, looked up on StackOverflow
        //seems to be a legit problem

        if isLowerCase {
            a.setTitle("A", forState: .Normal)
            b.setTitle("B", forState: .Normal)
            c.setTitle("C", forState: .Normal)
            d.setTitle("D", forState: .Normal)
            e.setTitle("E", forState: .Normal)
            f.setTitle("F", forState: .Normal)
            g.setTitle("G", forState: .Normal)
            h.setTitle("H", forState: .Normal)
            i.setTitle("I", forState: .Normal)
            j.setTitle("J", forState: .Normal)
            k.setTitle("K", forState: .Normal)
            l.setTitle("L", forState: .Normal)
            m.setTitle("M", forState: .Normal)
            n.setTitle("N", forState: .Normal)
            o.setTitle("O", forState: .Normal)
            p.setTitle("P", forState: .Normal)
            q.setTitle("Q", forState: .Normal)
            r.setTitle("R", forState: .Normal)
            s.setTitle("S", forState: .Normal)
            t.setTitle("T", forState: .Normal)
            u.setTitle("U", forState: .Normal)
            v.setTitle("V", forState: .Normal)
            w.setTitle("W", forState: .Normal)
            x.setTitle("X", forState: .Normal)
            y.setTitle("Y", forState: .Normal)
            z.setTitle("Z", forState: .Normal)
        } else {
            a.setTitle("a", forState: .Normal)
            b.setTitle("b", forState: .Normal)
            c.setTitle("c", forState: .Normal)
            d.setTitle("d", forState: .Normal)
            e.setTitle("e", forState: .Normal)
            f.setTitle("f", forState: .Normal)
            g.setTitle("g", forState: .Normal)
            h.setTitle("h", forState: .Normal)
            i.setTitle("i", forState: .Normal)
            j.setTitle("j", forState: .Normal)
            k.setTitle("k", forState: .Normal)
            l.setTitle("l", forState: .Normal)
            m.setTitle("m", forState: .Normal)
            n.setTitle("n", forState: .Normal)
            o.setTitle("o", forState: .Normal)
            p.setTitle("p", forState: .Normal)
            q.setTitle("q", forState: .Normal)
            r.setTitle("r", forState: .Normal)
            s.setTitle("s", forState: .Normal)
            t.setTitle("t", forState: .Normal)
            u.setTitle("u", forState: .Normal)
            v.setTitle("v", forState: .Normal)
            w.setTitle("w", forState: .Normal)
            x.setTitle("x", forState: .Normal)
            y.setTitle("y", forState: .Normal)
            z.setTitle("z", forState: .Normal)

        }
        isLowerCase = !isLowerCase

    }

    func getLeadingZeroes(binaryString : String) -> String {
        var leadingZeroes = ""
        if isBinary {
            for _ in 0..<(8-binaryString.characters.count) {
                leadingZeroes += "0"
            }
        }
        return leadingZeroes + binaryString + " "

    }
    
    func changeOutputMode(sender: AnyObject?) {
        let binHexButton = sender as! UIButton
        let title = binHexButton.titleForState(.Normal)
        if title == "Binary" {
            isBinary = true
        } else {
            isBinary = false
        }
    }
    
    
    func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        var binaryString = ""
        if isLowerCase {
            if isBinary {
                binaryString = String(lowercaseASCII[title!]!, radix: 2)
            } else {
                binaryString = String(lowercaseASCII[title!]!, radix: 16)
            }
        } else {
            if isBinary {
                binaryString = String(uppercaseASCII[title!]!, radix: 2)
            } else {
                binaryString = String(uppercaseASCII[title!]!, radix: 16)

            }
        }
        let finalString = getLeadingZeroes(binaryString)
        (textDocumentProxy as UITextDocumentProxy).insertText(finalString)
    }
    
    func spacePressed() {
        var spaceString = ""
        if isBinary {
            spaceString = "00100000 "
        } else {
            spaceString = "20 "
        }
        (textDocumentProxy as UITextDocumentProxy).insertText(spaceString)
    }
    
    func backSpacePressed() {
        (textDocumentProxy as UITextDocumentProxy).deleteBackward()

    }
    
    func loadInterface() {
        
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        UpperCaseButton.addTarget(self, action: "changeLetterCase", forControlEvents: .TouchUpInside)
        SelectBinaryButton.addTarget(self, action: "changeOutputMode:", forControlEvents: .TouchUpInside)
        SelectedHexButton.addTarget(self, action: "changeOutputMode:", forControlEvents: .TouchUpInside)
        BackSpaceButton.addTarget(self, action: "backSpacePressed", forControlEvents: .TouchUpInside)
        a.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        b.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        c.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        d.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        e.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        f.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        g.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        h.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        i.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        j.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        k.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        l.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        m.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        n.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        o.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        p.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        q.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        r.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        s.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        t.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        u.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        v.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        w.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        x.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        y.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        z.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        space.addTarget(self, action: "spacePressed", forControlEvents: .TouchUpInside)


        //nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)

    }

}
