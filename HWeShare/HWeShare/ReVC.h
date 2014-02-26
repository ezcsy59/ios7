//
//  ReVC.h
//  HWeShare
//
//  Created by mac on 14-2-26.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@interface ReVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *comfirm;
@property (strong, nonatomic) IBOutlet UIButton *back;

- (IBAction)re:(id)sender;

- (IBAction)ba:(id)sender;


@end
