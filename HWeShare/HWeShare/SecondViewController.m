//
//  SecondViewController.m
//  AKTabBar Example
//
//  Created by Ali KARAGOZ on 04/05/12.
//  Copyright (c) 2012 Ali Karagoz. All rights reserved.
//


#import "SecondViewController.h"
#import "CuzyAdBarView.h"
#import "CuzyAdSDK.h"
@implementation SecondViewController

- (id)init
{
  
    return self;
}

- (NSString *)tabImageName
{
	return @"image-2";
}

- (NSString *)tabTitle
{
	return @"热门精选";
}

- (void)viewDidLoad

{
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    [[CuzyAdSDK sharedAdSDK] setDelegate:self];
//    [[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"200446" andAppSecret:@"80dbaef8de4661c6fd42683b3ea65fb0"];
    
    [[CuzyAdSDK sharedAdSDK] setTestingURL];
    [[CuzyAdSDK sharedAdSDK] registerAppWithAppKey:@"200056" 	andAppSecret:@"051a9e4652fc5b881dfc6ba74d3cd633"];
    
}

-(void)viewDidAppear:(BOOL)animated{

    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"2" orSearchKeywords:@"" withPageIndex:0];
}

- (IBAction)showLayout1:(id)sender {
    [[CuzyAdSDK sharedAdSDK] fetchAppItemWithThemeID:@"" orSearchKeywords:@"iphone" withPageIndex:0];
}

@end
