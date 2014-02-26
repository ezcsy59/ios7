//
//  LoginVC.h
//  HWeShare
//
//  Created by mac on 14-2-21.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@interface LoginVC : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *backbutton;
- (IBAction)back:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)login:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *rebutton;

@end
