//
//  ViewController.swift
//  SwiftUrlSessionDemo
//
//  Created by shen on 15/11/25.
//  Copyright © 2015年 shen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let KScreenWidth=UIScreen.mainScreen().bounds.size.width;
    let KScreenHeight=UIScreen.mainScreen().bounds.size.height;

    var queryBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryBtn = UIButton(frame:CGRectMake(KScreenWidth/2-25, KScreenHeight/2-25, 50, 50))
        queryBtn.setTitle("请求", forState:.Normal)
        queryBtn.backgroundColor=UIColor.blackColor()
        queryBtn.addTarget(self, action: Selector("testGet"), forControlEvents:.TouchUpInside)
        self.view.addSubview(queryBtn)
//        testGet()
//        testPost()
//        testUrlSession()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testGet(){
        let para=["account": "shen"];
        Alamofire.request(.GET, "http://localhost:8002/getdemo",parameters:para)
            .responseJSON{ response in
                switch response.result {
                case .Success:
                    //把得到的JSON数据转为字典
                    if let resDic = response.result.value as? NSDictionary{
                        //获取字典里面的key为数组
                        let passwordStr = resDic.valueForKey("password")as! NSString
                        print(passwordStr)
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    func testPost(){
        let para=["postpara1": "postxcode","postpara2":"postnodejs"];
        Alamofire.request(.POST, "http://localhost:8002/postdemo",parameters:para)
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                if let JSON = response.result.value {
                    print("postJSON: \(JSON)")
                }
        }
    }
  
    //URLSession方法：
    func testUrlSession(){
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "http://localhost:8002/getdemo?para=session")!)
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("returnStr:\(string!)")
        })
        task.resume()
    }
}