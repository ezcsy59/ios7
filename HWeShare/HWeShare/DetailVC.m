//
//  DetailVC.m
//  HWeShare
//
//  Created by mac on 14-1-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "DetailVC.h"
#import "AppDelegate.h"
#import "SDImageView+SDWebCache.h"
#import "WebVC.h"
#import "KxMenu.h"
@interface DetailVC ()

@end

@implementation DetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)gotourl:(id)sender
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
     NSURL *url=[NSURL URLWithString:[myDelegate.detail objectForKey:@"click_url" ] ];
    
    myDelegate.url=url;
    WebVC *webvc =[[WebVC alloc]init];
    [self.navigationController pushViewController:webvc animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    self.ti.text = [myDelegate.detail objectForKey:@"title"];
    NSURL *url=[NSURL URLWithString:[myDelegate.detail objectForKey:@"pic_url" ] ];
    [self.image setImageWithURL:url ];
    UIBarButtonItem *btnCancel = [[UIBarButtonItem alloc]
                                  initWithTitle:@"分享"
                                  style:UIBarButtonItemStyleBordered
                                  target:self
                                  action:@selector(showMenu:)];
   
    self.navigationItem.rightBarButtonItem = btnCancel;
    
    
}

- (void)showMenu:(UIBarButtonItem *)sender
{
    
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"分享菜单"
                     image:nil
                    target:nil
                    action:NULL],
      
      [KxMenuItem menuItem:@"分享给微信朋友"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"分享到微信朋友圈"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"分享到分享平台"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
           ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    const CGFloat H = self.view.bounds.size.height;
    const CGFloat W = self.view.bounds.size.width;
    
    [KxMenu showMenuInView:self.view
                  fromRect:CGRectMake(W - 40, 5, 0, 0)
                 menuItems:menuItems];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
