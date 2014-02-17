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

#import "UIButton+Bootstrap.h"
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
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    { self.edgesForExtendedLayout = UIRectEdgeNone;}
    
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
    
    [self.lookbutton primaryStyle];
}

- (void) sendLinkContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    message.title = @"分享个宝贝儿";
    message.description = [myDelegate.detail objectForKey:@"title"];;
    [message setThumbImage: self.image.image];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = [myDelegate.detail objectForKey:@"click_url"];
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneSession;
    
    [WXApi sendReq:req];
}

- (void) sendLinkContent2
{
    WXMediaMessage *message = [WXMediaMessage message];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    message.title = @"分享个宝贝儿";
    message.description = [myDelegate.detail objectForKey:@"title"];;
    [message setThumbImage: self.image.image];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = [myDelegate.detail objectForKey:@"click_url"];
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    
    [WXApi sendReq:req];
}


-(IBAction)pushMenuItem:(id)sender
{
    [self sendLinkContent];
    NSLog(@"惦记了");
}

-(IBAction)pushMenuItem2:(id)sender
{
    [self sendLinkContent2];
    NSLog(@"惦记了");
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
                    action:@selector(pushMenuItem2:)],
      
      [KxMenuItem menuItem:@"分享到分享平台"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem3:)],
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
