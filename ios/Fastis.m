//
//  Fastis.m
//  RN_Multisteps
//
//  Created by Santhosh Umapathi on 12/4/22.
//

//Step 3
//File -> New File -> Obj-C File -> <Same Custom Module Name>

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

// Export the module
@interface RCT_EXTERN_MODULE(Fastis,NSObject)

// Export the methods of Module.
RCT_EXTERN_METHOD(incrementCount:
                    (RCTResponseSenderBlock)callback
                  );

RCT_EXTERN_METHOD(decrementCount:
                    (RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject
                  );

@end
