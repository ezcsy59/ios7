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
#import "TestViewController.h"
#import "AppDelegate.h"

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
        
        
       self.navigationController.navigationBarHidden = YES;     
    }
    return self;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];

}

- (NSString *)tabImageName
{
	return @"image-3";
}

- (NSString *)tabTitle
{
	return @"精彩首页";
}

-(IBAction)ManshirtClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"男装";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)ManpantClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"男裤";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)SportshirtClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"运动装";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)LadyshirtClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"女装";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)OnepieceClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"连衣裙";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)SkirtClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"半身裙";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)CasualshoeClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"休闲鞋";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)CanvashoeClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"帆布鞋";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)SportshoeClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"运动鞋";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    [self.navigationController pushViewController:t animated:true];
    
    NSLog(@"惦记了");
}

-(IBAction)MobilepowerClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"移动电源";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)PhoneshellClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"手机外壳";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
    NSLog(@"惦记了");
}

-(IBAction)EarphoneClicked:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = @"耳机耳麦";
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    
    TestViewController *t = [[TestViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:t animated:true];
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
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ManshirtClicked:)];
    [self.manshirt addGestureRecognizer:singleTap];

    
    self.manpant.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ManpantClicked:)];
    [self.manpant addGestureRecognizer:singleTap2];
    
    
    self.sportshirt.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SportshirtClicked:)];
    [self.sportshirt addGestureRecognizer:singleTap3];
    
    self.ladyshirt.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LadyshirtClicked:)];
    [self.ladyshirt addGestureRecognizer:singleTap4];
    
    self.onepiece.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnepieceClicked:)];
    [self.onepiece addGestureRecognizer:singleTap5];
    
    self.skirt.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SkirtClicked:)];
    [self.skirt addGestureRecognizer:singleTap6];
    
    self.casualshoe.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CasualshoeClicked:)];
    [self.casualshoe addGestureRecognizer:singleTap7];
    
    self.canvashoe.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(CanvashoeClicked:)];
    [self.canvashoe addGestureRecognizer:singleTap8];
    
    self.sportshoe.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SportshoeClicked:)];
    [self.sportshoe addGestureRecognizer:singleTap9];
    
    self.mobilepower.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MobilepowerClicked:)];
    [self.mobilepower addGestureRecognizer:singleTap10];
    
    self.phoneshell.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PhoneshellClicked:)];
    [self.phoneshell addGestureRecognizer:singleTap11];
    
    self.earphone.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(EarphoneClicked:)];
    [self.earphone addGestureRecognizer:singleTap12];
    
    
    
    
    
    
    
    
    
    
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
