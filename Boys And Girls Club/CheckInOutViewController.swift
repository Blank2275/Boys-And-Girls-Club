//
//  CheckInOutViewController.swift
//  Boys And Girls Club
//
//  Created by Connor Reed on 10/21/21.
//

import UIKit

class CheckInOutViewController: UIViewController {
    
    var isCheckIn = false
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timedateLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if isCheckIn{
            //check in
            //hid check out only features (name related elements)
            nameInput.isHidden = true
            nameLabel.isHidden = true
            //set button text
            self.submitButton.setTitle("Check In", for: .normal)
        } else {
            //check out
            //make sure the name elements are not hidden if you go to check out
            nameInput.isHidden = false
            nameLabel.isHidden = false
            //set button text
            self.submitButton.setTitle("Check Out", for: .normal)
        }
        //auto fill time and date
        let date = Date()
        var calendar = Calendar.current
        //set timezone of calendar to user's timezone
        //defaults to Mountain time
        if let timezone = TimeZone(identifier: TimeZone.current.abbreviation() ?? "GMT-6"){
            calendar.timeZone = timezone
        }
        let year = calendar.component(.year, from:date)
        let month = calendar.component(.month, from:date)
        let day = calendar.component(.day, from:date)
        var hour = calendar.component(.hour, from:date)
        let minute = calendar.component(.minute, from:date)
        var AMPM = "AM"
        //if hour > 12, subtract 12 and set to PM
        //hour and AMPM are variables because they might be changed in the following code
        if Int(hour) ?? 0 > 12{
            hour -= 12
            AMPM = "PM"
        }
        //add 0 to minute if it is in the single digits
        var adjustedMinute = String(minute) // minute changed to a string so 0 can be added to the beginning if neccesary
        if Int(minute) ?? 0 < 10{
            adjustedMinute = "0\(minute)"
        }
        let dateTimeString = "\(month)/\(day)/\(year)      \(hour):\(adjustedMinute) \(AMPM)"
        self.timedateLabel.text = dateTimeString
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
