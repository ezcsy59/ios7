//
//  FourthViewController.m
//  AKTabBar Example
//
//  Created by Ali KARAGOZ on 04/05/12.
//  Copyright (c) 2012 Ali Karagoz. All rights reserved.
//

#import "FourthViewController.h"
#import "SDImageView+SDWebCache.h"
#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"

#import "SBJSON.h"
@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"分享平台";
    }
    return self;
}

- (NSString *)tabImageName
{
	return @"image-4";
}


-(void)viewDidLoad
{
    NSString *urlString = @"http://humanplatform.sinaapp.com/index.php/Login/ios_login";
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
        NSMutableDictionary *dict = [jsonParser objectWithString:b];
        
    
    }
}

@end
