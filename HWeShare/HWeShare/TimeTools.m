//
//  TimeTools.m
//  HWeShare
//
//  Created by mac on 13-12-25.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "TimeTools.h"

@implementation TimeTools

//获取当前时间的时间戳
+(NSString *)getTimeNow
{
    NSDate *date =[[NSDate alloc] init];
    NSDateFormatter *df =[[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
    NSString *timestamp = [df stringFromDate:date];
    return timestamp;
    
}


@end
