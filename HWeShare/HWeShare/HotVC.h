//
//  HotVC.h
//  HWeShare
//
//  Created by mac on 14-1-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "OneCell.h"
@interface HotVC : UIViewController<ASIHTTPRequestDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (retain,nonatomic) NSMutableArray *array;

@end
