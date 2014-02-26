//
//  LoginVC.m
//  HWeShare
//
//  Created by mac on 14-2-21.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "LoginVC.h"
#import "ReVC.h"
#import "AppDelegate.h"
#import "UIButton+Bootstrap.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.loginbutton primaryStyle];
    [self.rebutton successStyle];
    [self.backbutton dangerStyle];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
   [self dismissModalViewControllerAnimated:YES];
}
- (IBAction)login:(id)sender {
    
    NSString *name=self.username.text;
    NSString *word=self.password.text;
    
    
    NSURL *url = [NSURL URLWithString:@"http://humanplatform.sinaapp.com/index.php/Login/ios_login"];
    ASIFormDataRequest *request = [  ASIFormDataRequest requestWithURL :url];
    [request setPostValue:name forKey:@"username"];
    [request setPostValue:word forKey:@"password"];
    
    //开始同步请求
    [request startSynchronous];

    NSError *error = [request error];
    if(!error){
        NSString *response = [request responseString];
        NSString *b = [response substringFromIndex:3];
        NSLog(b);
        if([b isEqual:@"true"])
        {
            AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
            myDelegate.username=name;
            [self dismissModalViewControllerAnimated:YES];

        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登录失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];

        }
    }

}
- (IBAction)re:(id)sender {
    ReVC *newProfileController =[[ReVC alloc]init];
    
    [self presentModalViewController:newProfileController animated:YES];

}
@end
