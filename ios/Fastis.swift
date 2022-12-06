//
//  Fastis.swift
//  RN_Multisteps
//
//  Created by Santhosh Umapathi on 12/4/22.
//

//Step 1
//File -> New File -> Swift File -> <Custom Module Name>

import Foundation

//Method 1
/*--
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
--*/

//Method 2
@objc(Fastis)
class Fastis: RCTEventEmitter{
  
  private var count = 0;
  
  @objc
  func incrementCount(_ callback:RCTResponseSenderBlock){
    count += 1;
    //print("COUNT =>", count)
    callback([count]) //Passing the count value to RN.
    sendEvent(withName: "incrementCount", body: ["Increment count", count])
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
      sendEvent(withName: "decrementCount", body: ["Decrement count", count])

    }
    
  }
  
  //Declare events here
  override func supportedEvents() -> [String]! {
    return ["incrementCount","decrementCount"]
  }
  
  
  @objc
  override static func requiresMainQueueSetup()->Bool{
    return true; // Runs on Main Thread at start, or, false, to run on background thread.
  }
  
  
  //Exporting initial values to RN
  @objc
  override func constantsToExport()->[AnyHashable:Any]!{
    return ["initialCount":0]
    
  }
  
}

