//
//  SearchVC.m
//  taobaoDemo
//
//  Created by MAC on 14-1-7.
//
//

#import "SearchVC.h"
#import "TestViewController.h"
#import "AppDelegate.h"
#import "UIViewController+AKTabBarController.h"


@interface SearchVC ()


@end

@implementation SearchVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"搜你所爱";
    }
    return self;
}


- (NSString *)tabImageName
{
	return @"sousuonew";
}

- (NSString *)tabTitle
{
	return @"搜你所爱";
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    
    
//    [tap release];
}

-(void)dismissKeyboard {
    [self.search resignFirstResponder];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.testsch = searchBar.text;
    NSLog( @"%s,%d" , __FUNCTION__ , __LINE__ );
    [searchBar resignFirstResponder];
    TestViewController *t = [[TestViewController alloc] init];
    [self.navigationController pushViewController:t animated:true];
    
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    
    [searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
