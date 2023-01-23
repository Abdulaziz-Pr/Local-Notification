//
//  ViewController.swift
//  countdownTimeKeeper
//
//  Created by admin on 04/05/1444 AH.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Pick: UIPickerView!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    var TimeCounter = [ "5 minutes", "10 minutes", "20 minutes","30 minutes" ]
    var reBack = 0
    var a: String = String()
    var b: String = String()
    var reS: Int = Int()
    var History : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Pick.delegate = self
        Pick.dataSource = self
        
    }
    
    @IBAction func timeCounter(_ sender: Any) {
        timer()
        let alert = UIAlertController(title: "\(self.TimeCounter[self.Pick.selectedRow(inComponent: 0)]) countdown", message: "After \(self.TimeCounter[self.Pick.selectedRow(inComponent: 0)]), you'll be notified. Turn on your ringer.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        present(alert, animated: true , completion: nil)
        reS = 0
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound,.badge] ){
                    granted, error in
                    if granted{
                        print("granted")
                        self.schedualeNotif()
                    }else{
                        print("denied")
                    }
                }
            }
            func schedualeNotif(){
                let content = UNMutableNotificationContent()
                content.title = "Alarm"
                content.body = "\(TimeCounter[Pick.selectedRow(inComponent: 0)]) Timer is Over \n"
                content.sound = .default
                content.badge = 1

                let trigger: UNTimeIntervalNotificationTrigger


                if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                     trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5 ), repeats: false)
                    let request = UNNotificationRequest(identifier: "alarmid", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }
                else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                     trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(10 * 60), repeats: false)
                    let request = UNNotificationRequest(identifier: "alarmid", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }
                else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                     trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(20 * 60), repeats: false)
                    let request = UNNotificationRequest(identifier: "alarmid", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }
                else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                     trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(30 * 60), repeats: false)
                    let request = UNNotificationRequest(identifier: "alarmid", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }
    }
    
    
    
    @IBAction func cancelbutton(_ sender: Any) {
        
        showingAlertView()
    }
    
    func timer(){
        let time = Date()
        let five = time.addingTimeInterval (Double (5) * 60)
        let ten = time.addingTimeInterval(Double (10) * 60)
        let twenty = time.addingTimeInterval (Double (20) * 60)
        let thirty = time.addingTimeInterval(Double (30) * 60)
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
            Label1.text = "Total time : 5 "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
            Label1.text = "Total time : 10 "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
            Label1.text = "Total time : 20 "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
            Label1.text = "Total time :30 "}
        
        
        
        if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
            Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
            Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
            Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
            Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
        
        
        b = "\(TimeCounter[Pick.selectedRow(inComponent: 0)]) timer set"
        Label3.text = b
        
        
        if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
            Label4.text = "Work Until :\(format.string(from: five))"}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
            Label4.text = "Work Until :\(format.string(from: ten))"}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
            Label4.text = "Work Until :\(format.string(from: twenty))"}
        else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
            Label4.text = "Work Until :\(format.string(from: thirty))"}
        
        
        
        }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TimeCounter.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TimeCounter[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: TimeCounter[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
        
        
    
    func showingAlertView(){
        let alert = UIAlertController(title: "", message: "Cancel curret timer?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: {action in
            print("back")
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ [self] action in
            if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                Label1.text = "Total time : 5 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                Label1.text = "Total time : 10 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                Label1.text = "Total time : 20 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                Label1.text = "Total time :30 "}
            
            if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            
            reS = 1
           a = "\(self.TimeCounter[self.Pick.selectedRow(inComponent: 0)]) Timer Cancelled"
            self.Label3.text = a
            StartButton.isHidden = false
            Pick.isHidden = false
        } ))
        
        present(alert, animated: true , completion: nil)
        
    }
    func showAlertView2(){
       
        let alert = UIAlertController(title: "", message: "Are you sure it's new day?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {action in
            print("Cancel")
            
        }))
        alert.addAction(UIAlertAction(title: "New Day", style: .destructive, handler:{ [self] action in
            self.Label1.text = ""
            self.Label2.text = ""
            self.Label3.text = ""
            self.Label4.text = ""
            
        } ))
        
        present(alert, animated: true , completion: nil)
        
    }
    
    @IBAction func Addingnew(_ sender: Any) {
        showAlertView2()
    }
    
    @IBAction func buttonshow(_ sender: Any) {
        let Today = Date()

        // 2. Pick the date components
        let hour   = Today.addingTimeInterval(TimeInterval(Calendar.current.component(.hour, from: Today)))
        let format = DateFormatter ( )
        // 3. Show the time
        switch reBack{

            // 1. Choose a date
        case 0:
            let Time = Date()
            let fivetime = Time.addingTimeInterval (Double (5) * 60)
            let tenTime = Time.addingTimeInterval(Double (10) * 60)
            let twentyTime = Time.addingTimeInterval (Double (20) * 60)
            let thirtyTime = Time.addingTimeInterval(Double (30) * 60)
            let format = DateFormatter ( )
            
            format.dateFormat = "hh:mm a"
            if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                Label1.text = "Total time : 5 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                Label1.text = "Total time : 10 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                Label1.text = "Total time : 20 "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                Label1.text = "Total time :30 "}
            
            if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                Label2.text = "0 hours , \(TimeCounter[Pick.selectedRow(inComponent: 0)]) "}
            
            
            
            // History of cancel button
            if TimeCounter[Pick.selectedRow(inComponent: 0)] == "5 minutes"{
                if reS == 0 {
                    Label5.text = " \(format.string(from: hour))  \(format.string(from: fivetime)) \(b) "
                    History.append(Label5.text!)}else{
                        Label5.text = " \(format.string(from: hour))  \(format.string(from: fivetime)) \(a) "
                        History.append(Label5.text!)
                    }
                        
                
                
            }
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "10 minutes"{
                if reS == 0 {
                    Label5.text = " \(format.string(from: hour))  \(format.string(from: tenTime)) \(b) "
                    History.append(Label5.text!)}else{
                        Label5.text = " \(format.string(from: hour))  \(format.string(from: tenTime)) \(a) "
                        History.append(Label5.text!)
                    }            }
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "20 minutes"{
                if reS == 0 {
                    Label5.text = " \(format.string(from: hour))  \(format.string(from: twentyTime)) \(b) "
                    History.append(Label5.text!)}else{
                        Label5.text = " \(format.string(from: hour))  \(format.string(from: twentyTime)) \(a) "
                        History.append(Label5.text!)
                    }            }
            else if TimeCounter[Pick.selectedRow(inComponent: 0)] == "30 minutes"{
                if reS == 0 {
                    Label5.text = " \(format.string(from: hour))  \(format.string(from: thirtyTime)) \(b) "
                    History.append(Label5.text!)}else{
                        Label5.text = " \(format.string(from: hour))  \(format.string(from: thirtyTime)) \(a) "
                        History.append(Label5.text!)
                    }
            }
            
            
            for _ in 0...History.count-1 {
                
                Label5.text = "\(History.joined(separator: "   "))"
            }
            
            Label5.isHidden = false
            Pick.isHidden = true
            Label4.isHidden = true
            Label3.isHidden = true
            StartButton.isHidden = true
            
            reBack += 1
        case 1:
            Pick.isHidden = false
            Label4.isHidden = false
            Label3.isHidden = false
            Label5.isHidden = true
            StartButton.isHidden = false
            timer()
            reBack -= 1
        default:
            break
        }
    }
    
    
}
