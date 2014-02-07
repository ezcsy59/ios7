//
//  HotVC.m
//  HWeShare
//
//  Created by mac on 14-1-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "HotVC.h"
#import "WebVC.h"
#import "SDImageView+SDWebCache.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"
#import "AppDelegate.h"
#import "SBJSON.h"
#import "UIViewController+AKTabBarController.h"
@interface HotVC ()

@end

@implementation HotVC



- (NSString *)tabImageName
{
	return @"image-2";
}

- (NSString *)tabTitle
{
	return @"特惠精选";
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"特惠精选";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}
    
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    // Do any additional setup after loading the view from its nib.
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    //构造键值对
	[dict hotDefault];
    //构造URL
	NSString *urlString = [dict urlString];
	urlString = [NSString stringWithFormat:@"http://api.59miao.com/router/rest?%@", urlString];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ ASIHTTPRequest requestWithURL :url];
    [request setDelegate:self];
    //开始异步请求
    [request startAsynchronous];
    
}

- ( void )requestFailed:( ASIHTTPRequest *)request
{
    NSError *error = [request error ];
    NSLog ( @"%@" ,error. userInfo );
   
}


-(void)requestFinished:(ASIHTTPRequest *)request
{
     NSString *response = [request responseString];
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    NSMutableDictionary *dict = [jsonParser objectWithString:response];
    NSMutableDictionary *re=[dict objectForKey:@"promos_get_response"];
    NSMutableDictionary *promos = [re objectForKey:@"promos"];
    NSMutableArray *promo = [promos objectForKey:@"promo"];
    self.array=promo;
    
    [self.tableview reloadData];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 310.0;
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
        
    
    static NSString *CellIdentifier = @"OneCellIdentifier";
    OneCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell= (OneCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"OneCell" owner:self options:nil] objectAtIndex:0];
    }
    
    // Configure the cell...
    NSMutableDictionary *temp = [self.array objectAtIndex:indexPath.row];

    NSString *title = [temp valueForKey:@"title" ];
    cell.bigtitle.text = title ;
    
//    NSString *celler = [temp valueForKey:@"seller_name"];
//    cell.subtitle.text = celler ;
    
    NSURL *url=[NSURL URLWithString:[temp valueForKey:@"pic_url_1"]];
    [cell.bigimage setImageWithURL:url];
//
//    NSString *price = [temp valueForKey:@"price"];
//    NSString *rmb=@"￥";
//    NSString *pricenew =[rmb stringByAppendingString:price];
//    
//    
//    
//    cell.price.text = pricenew ;
    
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
