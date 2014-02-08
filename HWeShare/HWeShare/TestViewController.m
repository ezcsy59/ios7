//
//  TestViewController.m
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import "TestViewController.h"
#import "SDImageView+SDWebCache.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"
#import "ASIHTTPRequest.h"
#import "SBJSON.h"
#import "MJRefresh.h"
#import "AppDelegate.h"
#import "DetailVC.h"
#import "UIViewController+AKTabBarController.h"
#import "SearchVC.h"

@interface TestViewController () <MJRefreshBaseViewDelegate>
{
     MJRefreshFooterView *_footer;
    
    
}

@end

static int page_no;

@implementation TestViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.array =[[NSMutableArray alloc] init ];
       
        AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
        self.search= myDelegate.testsch;
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    
    
}

//- (NSString *)tabImageName
//{
//	return @"sousuonew";
//}
//
//- (NSString *)tabTitle
//{
//	return @"搜你所爱";
//}

-(void)loadmore
{
    //页码增加
    page_no++;
    NSString *count = [NSString stringWithFormat:@"%d", page_no];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict testDefault];
    [dict setObject:count forKey:@"page_no"];
    NSString *s1=self.search;
    //    NSString *s2= [NSURL URLWithString: [s1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
   	[dict setObject:s1 forKey:@"keyword"];
    
	NSString *urlString = [dict urlString];
	urlString = [NSString stringWithFormat:@"http://api.59miao.com/router/rest?%@", urlString];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    //asihttprequest 测试
    ASIHTTPRequest *ASIrequest = [ASIHTTPRequest requestWithURL:url];
    [ASIrequest startSynchronous];
    NSError *error = [ASIrequest error];
    if(!error){
        NSString *response = [ASIrequest responseString];
        //        NSLog(response);
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:response];
        //                NSLog(dict);
        NSMutableDictionary *itemdic = [dict valueForKey:@"items_search_response"];
        NSMutableDictionary *itemscst =[itemdic valueForKey:@"items_search"];
        
        NSMutableDictionary *items = [itemscst valueForKey:@"items"];
        NSMutableArray *item =[items valueForKey:@"item"];
        //已获取到item
        [self.array addObjectsFromArray:item];
        
        NSLog(@"已增加到item");
    }
    
    [self.tableView reloadData];
    // 结束刷新状态
    [_footer endRefreshing];
    
    
    


}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationItem.title= self.search;
    
    // 防止block循环retain，所以用__unsafe_unretained
    __unsafe_unretained TestViewController *vc = self;
    
    //页码
    page_no=1;
    
    // 4.3行集成上拉加载更多控件
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = self.tableView;
    _footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        //        [vc loadmore];
        // 2秒后刷新表格
        [vc performSelector:@selector(loadmore) withObject:nil afterDelay:0.5];
    };
    //
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict testDefault];
	[dict setObject:self.search forKey:@"keyword"];
	NSString *urlString = [dict urlString];
	urlString = [NSString stringWithFormat:@"http://api.59miao.com/router/rest?%@", urlString];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    //	NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //	[web loadRequest:request];
    
    //asihttprequest 测试
    ASIHTTPRequest *ASIrequest = [ASIHTTPRequest requestWithURL:url];
    [ASIrequest startSynchronous];
    NSError *error = [ASIrequest error];
    if(!error){
        NSString *response = [ASIrequest responseString];
        //        NSLog(response);
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:response];
        //                NSLog(dict);
        NSMutableDictionary *itemdic = [dict valueForKey:@"items_search_response"];
        NSString *total=[itemdic valueForKey:@"total_results"];
        if([total isEqualToString:@"0"])
        {
            
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                          message:@"暂无此商品，以后会陆续添加\n 请按返回"
                                                         delegate:nil
                                                cancelButtonTitle:@"确定"
                                                otherButtonTitles:nil];
            alert.delegate =self;
            [alert show];
        
            
            return;
    
        }
        NSMutableDictionary *itemscst =[itemdic valueForKey:@"items_search"];
        
        NSMutableDictionary *items = [itemscst valueForKey:@"items"];
        NSMutableArray *item =[items valueForKey:@"item"];
        //已获取到item
        self.array = item;
        
        
       
        
        NSLog(@"已获取到item");
    }

  

    
    
//    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* msg = [[NSString alloc] initWithFormat:@"您按下的第%d个按钮！",buttonIndex];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:msg
                                                  delegate:nil
                                         cancelButtonTitle:@"确定"
                                         otherButtonTitles:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
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
//   static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
//    
//   static BOOL nibsRegistered = NO;
//    if (!nibsRegistered) {
//        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
//        nibsRegistered = YES;
//   
   
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];

    
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
    myDelegate.detail = [self.array objectAtIndex:indexPath.row];
    
    DetailVC *de = [[DetailVC alloc] init];
    [self.navigationController pushViewController:de animated:YES];
    
}



@end
