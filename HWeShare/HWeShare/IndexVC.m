//
//  IndexVC.m
//  HWeShare
//
//  Created by mac on 14-1-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "IndexVC.h"
#import "UIViewController+AKTabBarController.h"

#import "SDImageView+SDWebCache.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"

#import "SBJSON.h"


@interface IndexVC ()

@end

@implementation IndexVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.pics=[[NSMutableArray alloc] init];
        self.titils =[[NSMutableArray alloc] init];
       
    }
    return self;
}

- (NSString *)tabImageName
{
	return @"image-3";
}

- (NSString *)tabTitle
{
	return @"精彩首页";
}

-(IBAction)UserClicked:(id)sender
{
    NSLog(@"惦记了");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}

    // Do any additional setup after loading the view from its nib.
    
    CGSize newSize = CGSizeMake(320, 568);
    [self.scroll setContentSize:newSize];
    
    
    self.manshirt.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(UserClicked:)];
    [self.manshirt addGestureRecognizer:singleTap];
    
    
    // Do any additional setup after loading the view from its nib.
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    //构造键值对
	[dict picDefault];
    //构造URL
	NSString *urlString = [dict urlString];
	urlString = [NSString stringWithFormat:@"http://api.59miao.com/router/rest?%@", urlString];
	urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ ASIHTTPRequest requestWithURL :url];
    
    //开始同步请求
    [request startSynchronous];
    
    NSError *error = [request error];
    if(!error){
        NSString *response = [request responseString];
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:response];
        NSMutableDictionary *re=[dict objectForKey:@"pictorials_get_response"];
        NSMutableDictionary *pictors=[re objectForKey:@"pictorials"];
        NSMutableArray *pictor=[pictors objectForKey:@"pictorial"];
        NSMutableDictionary *temp =[[NSMutableDictionary alloc ] init];
        for(int i=0;i<pictor.count;i++)
        {
            temp =[pictor objectAtIndex:i];
            [self.pics addObject:[temp objectForKey:@"pic_url"]];
            [self.titils addObject:[temp objectForKey:@"title"]];
            
        }
        
        // 初始化自定义ScrollView类对象
        AOScrollerView *aSV = [[AOScrollerView alloc]initWithNameArr:self.pics titleArr:self.titils height:200];
        //添加进view
        [self.view addSubview:aSV];
        
    
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
