//
//  ViewController.swift
//  Single_UIStudy
//
//  Created by YMP on 2016. 7. 7..
//  Copyright © 2016 YMP. All rights reserved.
//



//UIScrollView


import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{
    
    
    //@IBOutlet weak
    //var RectChangeBtn: UIButton = UIButton()
    
    //var RectView: UIView = UIView()
    
    var SV: UIScrollView = UIScrollView()
    var textPost: UILabel = UILabel()
    
    var offsetText: UILabel = UILabel()
    
    let v = UIView()
    let pageCtrl = UIPageControl()
    
    let upScrollBtn = UIButton()
    let upScrollBtn_shadow = UIView()
    
    var CircleRect: UIView = UIView()

    var myThread: ThreadingClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myThread = ThreadingClass()
        myThread.scroll = SV
        
        
        SV.delegate = self
        
        SV.frame = CGRect(x: 0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        
        SV.contentSize.height = SV.frame.height * 2
        SV.contentSize.width = SV.frame.width * 4
        SV.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
        //SV.pagingEnabled = true
        self.view.addSubview(SV)
        
        textPost.text = "ScrollTitle"
        textPost.frame = CGRectMake(0, 0, 100, 100)
        textPost.textColor = UIColor.lightGrayColor()
        SV.addSubview(textPost)

        
        pageCtrl.frame = CGRectMake(0, SV.frame.maxY - 50, self.view.frame.width, 50)
        pageCtrl.numberOfPages = 4
        pageCtrl.currentPage = 0
        pageCtrl.enabled = true
        //pageCtrl.tintColor
        self.view.addSubview(pageCtrl)
        
        upScrollBtn.frame = CGRectMake(self.view.frame.width - 50 - 15, self.view.frame.height - 50 - 15, 50, 50)
        upScrollBtn.layer.cornerRadius = upScrollBtn.frame.width/2
        upScrollBtn.addTarget(self, action: #selector(ViewController.scrollUp200(_:)), forControlEvents: .TouchUpInside)
        upScrollBtn.backgroundColor = UIColor.whiteColor()
        upScrollBtn.setTitle("⋀", forState: .Normal)
        upScrollBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        // ^ shadow
        upScrollBtn_shadow.frame = CGRectMake(upScrollBtn.frame.minX+2, upScrollBtn.frame.minY+2, 50, 50)
        upScrollBtn_shadow.backgroundColor = UIColor.lightGrayColor()
        upScrollBtn_shadow.layer.cornerRadius = upScrollBtn_shadow.frame.width/2
        self.view.addSubview(upScrollBtn_shadow)
        self.view.addSubview(upScrollBtn)
        
        //self.view.backgroundColor = UIColor(CGColor: )
        
        
        CircleRect.backgroundColor = UIColor(red: 252/255, green: 129/255, blue: 97/255, alpha: 1)
        CircleRect.frame = CGRect(x: self.view.frame.midX - (300/2), y: self.view.frame.midY - (300/2), width: 300, height: 300)//brief size
        CircleRect.layer.cornerRadius = CircleRect.frame.width/2
        self.view.addSubview(CircleRect)
        
        
        //offsetText.frame = CGRectMake(self.view.frame.width/2-150, self.view.frame.height/2-50, 300, 100)
        offsetText.frame = CGRectMake(self.view.frame.midX-200, self.view.frame.midY-50, 400, 100)
        //offsetText.backgroundColor = UIColor.blackColor()//배경색
        offsetText.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0)
        offsetText.font = UIFont(name: "Helvetica", size: 110)
        //offsetText.font = UIFont(name: "Godo", size: 110)
        //offsetText.font = UIFont.systemFontOfSize(110)
        offsetText.textAlignment = .Center
        self.view.addSubview(offsetText)
        CircleRect.userInteractionEnabled = false // touch interaction bool
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //vertical scroll
        
        
        offsetText.text = "\(SV.contentOffset.y)"
        offsetText.textColor = UIColor(red: abs(SV.contentOffset.y/1003), green: abs(SV.contentOffset.y/102), blue: abs(SV.contentOffset.y/20), alpha: 1) //used abs(:int) for absolute number
        SV.backgroundColor = UIColor(red: abs(SV.contentOffset.y/123*2), green: abs(SV.contentOffset.y/1233*2), blue: abs(SV.contentOffset.y/23*2), alpha: 1)
        
        if(SV.contentOffset.y == 0){//if offset is 0.0, set backgroundColor as default(first) color
            SV.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
        }
 
        //horizantal scroll
        
//        SV.backgroundColor = UIColor(red: abs(SV.contentOffset.x/123*2), green: abs(SV.contentOffset.x/1233*2), blue: abs(SV.contentOffset.x/23*2), alpha: 1) //used abs(:int) for absolute number
//        offsetText.text = "\(SV.contentOffset.x)"
//        offsetText.textColor = UIColor(red: abs(SV.contentOffset.x/1003), green: abs(SV.contentOffset.x/102), blue: abs(SV.contentOffset.x/20), alpha: 1)
        
        CircleRect.layer.cornerRadius = 150 - (abs(SV.contentOffset.y) * 0.2)
        CircleRect.backgroundColor = UIColor(red: abs(SV.contentOffset.y/1003)+123+2, green: abs(SV.contentOffset.y/102)+1233, blue: abs(SV.contentOffset.y/20+23), alpha: 1)
        
//        CircleRect.layer.cornerRadius = 150 - (abs(SV.contentOffset.x) * 0.2)
//        CircleRect.backgroundColor = UIColor(red: abs(SV.contentOffset.x/1003)+123+2, green: abs(SV.contentOffset.x/102)+1233, blue: abs(SV.contentOffset.x/20+23), alpha: 1)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //Page Control
        pageCtrl.currentPage = 4 - Int((SV.contentSize.width - SV.contentOffset.x)/SV.frame.width)
    }
    
    func scrollUp200(sender: UIButton){
        SV.setContentOffset(CGPointMake(SV.contentOffset.x, SV.contentOffset.y-60) , animated: true)
        //myThread.thread.cancel()//threading Stop
        
    }
    
}


