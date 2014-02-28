//
//  ShareVC.m
//  HWeShare
//
//  Created by mac on 14-2-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ShareVC.h"
#import "SDImageView+SDWebCache.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"
#import "UIViewController+AKTabBarController.h"
#import "SBJSON.h"
#import "CustomCell.h"
#import "MJRefresh.h"
#import "WebVC.h"
#import "AppDelegate.h"
@interface ShareVC ()<MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *_header;
    
}

@end

@implementation ShareVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title=@"分享平台";
        
         self.array =[[NSMutableArray alloc] init ];
    }
    return self;
}

- (NSString *)tabImageName
{
	return @"image-4";
}

- (NSString *)tabTitle
{
	return @"分享平台";
}

-(void)loadmore
{
    
    
    NSString *urlString = @"http://humanplatform.sinaapp.com/index.php/Product/ios_index";
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ ASIHTTPRequest requestWithURL :url];
    
    //开始同步请求
    [request startSynchronous];
    
    NSError *error = [request error];
    if(!error){
        NSString *response = [request responseString];
        NSString *b = [response substringFromIndex:3];
        NSLog(b);
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        //        NSMutableDictionary *dict = [jsonParser objectWithString:b];
        NSMutableArray *arr=[jsonParser objectWithString:b];
        self.array=arr;
    }
    
    [self.tableView reloadData];
    // 结束刷新状态
    [_header endRefreshing];

}
-(void)addheader
{
    // 防止block循环retain，所以用__unsafe_unretained
    __unsafe_unretained ShareVC *vc = self;
    // 3.3行集成下拉刷新控件
    _header = [MJRefreshHeaderView header];
    _header.scrollView = self.tableView;
    _header.delegate = self;
    
 

}
#pragma mark - 刷新的代理方法---进入下拉刷新\上拉加载更多都有可能调用这个方法
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _header) { // 下拉刷新
        
        // 2秒后刷新表格
        [self performSelector:@selector(loadmore) withObject:nil afterDelay:0.5];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}
    
    [self addheader];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSString *urlString = @"http://humanplatform.sinaapp.com/index.php/Product/ios_index";
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ ASIHTTPRequest requestWithURL :url];
    
    //开始同步请求
    [request startSynchronous];
    
    NSError *error = [request error];
    if(!error){
        NSString *response = [request responseString];
        NSString *b = [response substringFromIndex:3];
        NSLog(b);
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
//        NSMutableDictionary *dict = [jsonParser objectWithString:b];
        NSMutableArray *arr=[jsonParser objectWithString:b];
        self.array=arr;
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(self.array!=nil)
        return self.array.count;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCellIdentifier";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell= (CustomCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"CustomCell" owner:self options:nil] objectAtIndex:0];
    }
    
    // Configure the cell...
    NSMutableDictionary *temp = [self.array objectAtIndex:indexPath.row];
    
    NSString *title = [temp valueForKey:@"title" ];
    cell.title.text = title ;
    
    NSString *celler = [temp valueForKey:@"seller_name"];
    cell.subtitle.text = celler ;
    
    NSURL *url=[NSURL URLWithString:[temp valueForKey:@"pic_url"]];
    [cell.image setImageWithURL:url];
    
    NSString *price = [temp valueForKey:@"price"];
    NSString *rmb=@"￥";
    NSString *pricenew =[rmb stringByAppendingString:price];
    
    
    
    cell.price.text = pricenew ;
    
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *temp = [self.array objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:[temp objectForKey:@"click_url" ] ];
    
    myDelegate.url=url;
    
    WebVC *webvc =[[WebVC alloc]init];
    [self.navigationController pushViewController:webvc animated:YES];
    
    
    //    myDelegate.detail = [self.array objectAtIndex:indexPath.row];
    
    //    DetailVC *de = [[DetailVC alloc] init];
    //    [self.navigationController pushViewController:de animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
