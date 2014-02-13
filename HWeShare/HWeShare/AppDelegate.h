//
//  AppDelegate.h
//  HWeShare
//
//  Created by mac on 13-12-24.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRTabBarController.h"
#import "WXApi.h"

@class AKTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,CRTabBarControllerDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) AKTabBarController *tabBarController;

@property (nonatomic, retain) NSString  *testsch;

@property (nonatomic, retain) NSURL  *url;

@property (nonatomic, retain) NSMutableDictionary  *detail;
@end
