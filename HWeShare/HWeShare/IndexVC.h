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

@end
