//
//  Fastis.swift
//  RN_Multisteps
//
//  Created by Santhosh Umapathi on 12/4/22.
//

//Step 1
//File -> New File -> Swift File -> <Custom Module Name>

import Foundation

@objc(Fastis)
class Fastis: NSObject{
  
  private var count = 0;
  
  @objc
  func incrementCount(_ callback:RCTResponseSenderBlock){
    count += 1;
    //print("COUNT =>", count)
    callback([count]) //Passing the count value to RN.
  }
  
  @objc
  func decrementCount(_ resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock){
    
    if(count == 0)
    {
      let error = NSError(domain: "", code: 400, userInfo: nil);
      reject("ERROR DECREMENT","Unable to decrement count",error);
    }
    else
    {
      count-=1;
      resolve("Success decrement: \(count)");
    }
    
  }
  
  
  
  
  
  
  
  
  @objc
  static func requiresMainQueueSetup()->Bool{
    return true; // Runs on Main Thread at start, or, false, to run on background thread.
  }
  
  
  //Exporting initial values to RN
  @objc
  func constantsToExport()->[String:Any]!{
    return ["initialCount":0]
    
  }
  
}

