//
//  ReVC.m
//  HWeShare
//
//  Created by mac on 14-2-26.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ReVC.h"
#import "UIButton+Bootstrap.h"
@interface ReVC ()

@end

@implementation ReVC

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
    [self.comfirm primaryStyle];
    [self.back dangerStyle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)re:(id)sender {
    NSString *name=self.username.text;
    NSString *word=self.password.text;
    
    
    NSURL *url = [NSURL URLWithString:@"http://humanplatform.sinaapp.com/index.php/User/ios_adduser"];
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
           [self dismissModalViewControllerAnimated:YES];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
        }
    }


}

- (IBAction)ba:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}


@end
