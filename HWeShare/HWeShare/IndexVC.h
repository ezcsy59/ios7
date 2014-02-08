//
//  IndexVC.h
//  HWeShare
//
//  Created by mac on 14-1-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "AOScrollerView.h"
@interface IndexVC : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (nonatomic,retain) NSMutableArray *pics;

@property (nonatomic,retain) NSMutableArray *titils;



@property (strong, nonatomic) IBOutlet UIImageView *manshirt;
@property (strong, nonatomic) IBOutlet UIImageView *manpant;
@property (strong, nonatomic) IBOutlet UIImageView *sportshirt;
@property (strong, nonatomic) IBOutlet UIImageView *ladyshirt;
@property (strong, nonatomic) IBOutlet UIImageView *onepiece;
@property (strong, nonatomic) IBOutlet UIImageView *skirt;
@property (strong, nonatomic) IBOutlet UIImageView *casualshoe;
@property (strong, nonatomic) IBOutlet UIImageView *canvashoe;
@property (strong, nonatomic) IBOutlet UIImageView *sportshoe;
@property (strong, nonatomic) IBOutlet UIImageView *mobilepower;
@property (strong, nonatomic) IBOutlet UIImageView *phoneshell;
@property (strong, nonatomic) IBOutlet UIImageView *earphone;

@end
