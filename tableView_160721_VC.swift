//
//  ViewController.swift
//  TableView_Study
//
//  Created by YMP on 2016. 7. 21..
//  Copyright © 2016년 YMP. All rights reserved.
//


//needs to storyboard setting and I hate that

import UIKit

class ViewController: UITableViewController , UITextFieldDelegate{

    var msg:[(lastMSG: NSString, howmanyMSG: Int)] = []
    var msgTextField: UITextField = UITextField()
    
    var msgTF_width: CGFloat = 250
    var msgTF_height: CGFloat = 50
    
    var msgInputBtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.tableView.frame = CGRectMake(0, 20, self.tableView.frame.width, self.tableView.frame.height - 20)
        
        msgTextField.frame = CGRect(x: self.view.frame.midX - (msgTF_width/2), y: self.view.frame.maxY - msgTF_height - 10, width: msgTF_width, height: msgTF_height)
        msgTextField.layer.cornerRadius = 7
        msgTextField.layer.borderWidth = 1
        msgTextField.layer.borderColor = UIColor(red: 252/255, green: 129/255, blue: 97/255, alpha: 1).CGColor//red from hu//convert into CGcolor
        msgTextField.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 226/255, alpha: 1)//sand fron hu
        msgTextField.delegate = self
        self.view.addSubview(msgTextField)
        
        msgInputBtn.frame = CGRect(x: msgTextField.frame.maxX - 50 - 10, y: msgTextField.frame.midY - 20, width: 40, height: 40)
        msgInputBtn.backgroundColor = UIColor.whiteColor()
        
        msgInputBtn.layer.cornerRadius = 5
        msgInputBtn.layer.borderWidth = 1
        msgInputBtn.setTitle("↵", forState: .Normal)
        msgInputBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.view.addSubview(msgInputBtn)
        msgInputBtn.addTarget(self, action: #selector(ViewController.msgInput(_:)), forControlEvents: .TouchUpInside)
        
        msg.append(("Swift Study", 3))
        msg.append(("Too much fun", 4))
        msg.append(("It kills me with fun", 2))
        msg.append(("Type more texts", 111))
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if(textField.text == nil){
            return false
        }
        else{
            
            msg.append((textField.text!, msg.endIndex))
            self.tableView.reloadData()
            textField.resignFirstResponder()
            textField.text = ""
            
            return true;

        }
        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        msg.removeAtIndex(indexPath.row)
        self.tableView.reloadData()
    }
    
    
    func msgInput(sender: UIButton){
            msg.append((msgTextField.text!, msg.endIndex))
        self.tableView.reloadData()

    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section: \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        
        let label = UILabel()
        label.frame = CGRectMake(0, 0, 400, 30)
        
    
        //label.text = "\(indexPath.section)::\(indexPath.row)"
        
        label.text = "\(msg[indexPath.row].lastMSG)        new :: \(msg[indexPath.row].howmanyMSG)"
        
        label.numberOfLines = 0
        
        cell.addSubview(label)
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        
        switch section{
            default :
                return msg.endIndex
        }
    }
    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let temp_view: UIView = UIView()
        
        temp_view.backgroundColor = UIColor.lightGrayColor()
        
        return temp_view
        
    }
    
//    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//    }
    
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

