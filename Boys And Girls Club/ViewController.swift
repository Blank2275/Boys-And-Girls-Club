//
//  ViewController.swift
//  Boys And Girls Club
//
//  Created by Connor Reed on 10/20/21.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkIn(_ sender: Any) {
        performSegue(withIdentifier: "checkInOut", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //tell check in/out screen wether it is in check in mode or check out mode
        if segue.identifier == "checkInOut"{
            let svc = segue.destination as! CheckInOutViewController
            if sender == nil{
                //check in case
                //default is set tofalse
                svc.isCheckIn = true
            }
        }
    }
    

}

