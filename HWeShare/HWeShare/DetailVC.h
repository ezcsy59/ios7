//
//  DetailVC.h
//  HWeShare
//
//  Created by mac on 14-1-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApiObject.h"

@interface DetailVC : UIViewController

- (IBAction)gotourl:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *ti;

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *lookbutton;

@end
