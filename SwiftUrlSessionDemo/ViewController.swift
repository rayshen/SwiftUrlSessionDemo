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

    override func viewDidLoad() {
        super.viewDidLoad()
        testGet()
        testPost()
        testUrlSession()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testGet(){
        let para=["getpara1": "getxcode","getpara2":"getnodejs"];
        Alamofire.request(.GET, "http://localhost:8002/getdemo",parameters:para)
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                if let JSON = response.result.value {
                    print("getJSON: \(JSON)")
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