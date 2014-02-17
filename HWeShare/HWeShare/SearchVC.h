//
//  SearchVC.h
//  taobaoDemo
//
//  Created by MAC on 14-1-7.
//
//

#import <UIKit/UIKit.h>



@interface SearchVC : UIViewController<UISearchBarDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *search;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (retain,nonatomic) NSMutableArray *array;
@end
