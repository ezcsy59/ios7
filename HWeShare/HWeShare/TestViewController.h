//
//  TestViewController.h
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface TestViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{

    
}
@property (retain,nonatomic) NSMutableArray *array;

@property (retain,nonatomic) NSString *search;
-(void)loadmore;


@end
