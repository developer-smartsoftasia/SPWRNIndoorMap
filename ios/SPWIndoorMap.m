//
//  SPWIndoorMap.m
//  IconSiamApp
//
//  Created by Itthisak Phueaksri on 13/1/2564 BE.
//  Copyright © 2564 BE Facebook. All rights reserved.
//

#import "SPWIndoorMap.h"

#import <RNIndoorMap/RNIndoorMap.h>

@implementation SPWIndoorMap

RCT_EXPORT_MODULE(SPWIndoorMap)

RCT_EXPORT_METHOD(getVenuesSuccessCallback:(RCTResponseSenderBlock)successCallback errorCallback: (RCTResponseErrorBlock) errorCallback) {
  [SPWIndoorMapManager getVenuesWithCompletionBlock:^{
    successCallback(@[]);
  } failureBlock:^(NSError *error) {
    errorCallback(error);
  }];
}

RCT_EXPORT_METHOD(presentIndoorMap) {
  dispatch_async(dispatch_get_main_queue(), ^{
    UIViewController * vc = [[SPWIndoorMapManager sharedInstance] viewController];
    [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:vc
                                                                                       animated:YES completion:nil];
  });

}

RCT_EXPORT_METHOD(setStores:(NSArray<NSDictionary<NSString *, id> *> *) stores) {
  [SPWIndoorMapManager setStores:stores];
}

RCT_EXPORT_METHOD(setFloorNumber:(int) floorNumber) {
  [SPWIndoorMapManager setFloor:floorNumber];
}

RCT_EXPORT_METHOD(getStoreByID:(NSString *) storeId success:(RCTResponseSenderBlock)successCallback) {
  NSError* error = nil;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[SPWIndoorMapManager getStoreByID:storeId] options:NSJSONWritingPrettyPrinted error:&error];
  NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  successCallback(@[jsonString]);
}

RCT_EXPORT_METHOD(getAllStoresJSON:(RCTResponseSenderBlock)successCallback) {
  NSError* error = nil;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[SPWIndoorMapManager getAllStores] options:NSJSONWritingPrettyPrinted error:&error];
  NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  successCallback(@[jsonString]);
}

RCT_EXPORT_METHOD(setOrigin:(NSString *) storeId) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [SPWIndoorMapManager setOrigin:storeId];
  });

}

RCT_EXPORT_METHOD(setDestination:(NSString *) storeId) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [SPWIndoorMapManager setDestination:storeId];
  });
}

RCT_EXPORT_METHOD(resetOriginAndDestination) {
  [SPWIndoorMapManager resetOrginAndDestination];
}


@end

