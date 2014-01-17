 //
//  NSMutableDictionaryTaobao.m
//  audioBook
//
//  Created by YangZigang on 11-1-19.
//  Copyright 2011 audiocn.com. All rights reserved.
//

#import "NSMutableDictionaryTaobao.h"
#import "NSStringEx.h"

// MARK: -
// MARK: 请填写实际的app_key和 app_secret_key
static NSString* const app_key = @"1029925";
static NSString* const app_secret_key = @"7a8c5138e845ee975cb17f8a896c6b79";


@implementation NSMutableDictionary (Taobao)

- (NSString*)urlString
{
    
//    NSString *re;
//    NSArray *array = [self allKeys];
//	array = [array sortedArrayUsingSelector:@selector(compare:)];
//	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
//	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
//    //	[str appendString:app_secret_key];
//	NSUInteger i, count = [array count];
//	for (i = 0; i < count; i++) {
//		if ([url length]) {
//			[url appendString:@"&"];
//		}
//		NSString * obj = [array objectAtIndex:i];
//		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
//		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
//	}
//    re= [app_secret_key stringByAppendingString:str];
//    NSLog(re);
//    NSString *hash = [re md5];
//    
////    NSString *test = @"7a8c5138e845ee975cb17f8a896c6b79app_key1029925fieldstitle,click_urlformatjsonkeyword三星method59miao.items.searchpage_no1page_size20timestamp2014-01-06 13:27:11v1.1";
////   hash = [test md5];
//    
//    [self setObject:hash forKey:@"sign"];
//	array = [self allKeys];
//	array = [array sortedArrayUsingSelector:@selector(compare:)];
//	[url setString:@""];
//	for (i = 0; i < [array count]; i++) {
//		if ([url length]) {
//			[url appendString:@"&"];
//		}
//		NSString *obj = [array objectAtIndex:i];
//		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
//	}
//	
//    
//	return url;

    NSString *re;
    NSArray *array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
    //	[str appendString:app_secret_key];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString * obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
	}
    re= [app_secret_key stringByAppendingString:str];
    
    //    re= [NSURL URLWithString: [re stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
    NSLog(re);
    
    NSString *hash = [re md5];
    [self setObject:hash forKey:@"sign"];
	array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	[url setString:@""];
	for (i = 0; i < [array count]; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString *obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
	}
	
    //    url= [NSURL URLWithString: [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
    //    NSLog(url);
    return url;

}

- (NSString*)urlString2
{
	[self setObject:app_key forKey:@"app_key"];
	NSArray *array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
	[str appendString:app_secret_key];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString * obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
	}
	[str appendString:app_secret_key];
	NSString *hash = [ str md5];
	[self setObject:hash forKey:@"sign"];
	array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	[url setString:@""];
	for (i = 0; i < [array count]; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString *obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
	}
	return url;
}

- (NSString*)urlStringMiao
{
    NSString *re;
    NSArray *array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	NSMutableString *url = [NSMutableString stringWithCapacity:1024];
	NSMutableString *str = [NSMutableString stringWithCapacity:1024];
//	[str appendString:app_secret_key];
	NSUInteger i, count = [array count];
	for (i = 0; i < count; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString * obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
		[str appendFormat:@"%@%@",obj, [self objectForKey:obj]];
	}
    re= [app_secret_key stringByAppendingString:str];
    NSLog(re);
    NSString *hash = [re md5];
    [self setObject:hash forKey:@"sign"];
	array = [self allKeys];
	array = [array sortedArrayUsingSelector:@selector(compare:)];
	[url setString:@""];
	for (i = 0; i < [array count]; i++) {
		if ([url length]) {
			[url appendString:@"&"];
		}
		NSString *obj = [array objectAtIndex:i];
		[url appendFormat:@"%@=%@", obj, [self objectForKey:obj]];
	}
	//[url appendFormat:@"&sign=%@", hash];
    
	return url;

    
    
}
///**
// * 新的md5签名，首尾放secret。
// *
// * @param params 传给服务器的参数
// *
// * @param secret 分配给您的APP_SECRET
// */
//public static String md5Signature(TreeMap<String, String> params, String secret) {
//    String result = null;
//    StringBuffer orgin = getBeforeSign(params, new StringBuffer(secret));
//    if (orgin == null)
//        return result;
//    // secret last
//    orgin.append(secret);
//    try {
//        MessageDigest md = MessageDigest.getInstance("MD5");
//        result = byte2hex(md.digest(orgin.toString().getBytes("utf-8")));
//    } catch (Exception e) {
//        throw new java.lang.RuntimeException("sign error !");
//    }
//    return result;
//}
///**
// * 二进制转字符串
// */
//private static String byte2hex(byte[] b) {
//    StringBuffer hs = new StringBuffer();
//    String stmp = "";
//    for (int n = 0; n < b.length; n++) {
//        stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
//        if (stmp.length() == 1)
//            hs.append("0").append(stmp);
//        else
//            hs.append(stmp);
//    }
//    return hs.toString();
//}
///**
// * 添加参数的封装方法
// * @param params
// * @param orgin
// * @return
// */
//private static StringBuffer getBeforeSign(TreeMap<String, String> params, StringBuffer orgin) {
//    if (params == null)
//        return null;
//    Map<String, String> treeMap = new TreeMap<String, String>();
//    treeMap.putAll(params);
//    Iterator<String> iter = treeMap.keySet().iterator();
//    while (iter.hasNext()) {
//        String name = (String) iter.next();
//        orgin.append(name).append(params.get(name));
//    }
//    return orgin;
//}


- (void)testDefault
{

	[self setObject:app_key forKey:@"app_key"];


	[self setObject:@"title,click_url" forKey:@"fields"];
	[self setObject:@"json" forKey:@"format"];
	[self setObject:@"59miao.items.search" forKey:@"method"];
	[self setObject:@"1.1" forKey:@"v"];
    [self setObject:@"20" forKey:@"page_size"];
    [self setObject:@"1" forKey:@"page_no"];
	NSDate *date = [NSDate date];
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
	[self setObject:[df stringFromDate:date] forKey:@"timestamp"];

}

-(void)hotDefault
{
    
	[self setObject:app_key forKey:@"app_key"];
	[self setObject:@"title,click_url" forKey:@"fields"];
	[self setObject:@"json" forKey:@"format"];
	[self setObject:@"59miao.promos.list.get" forKey:@"method"];
	[self setObject:@"1.1" forKey:@"v"];
    [self setObject:@"20" forKey:@"page_size"];
    [self setObject:@"1" forKey:@"page_no"];
	 NSDate *date = [NSDate date];
	 NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
	[self setObject:[df stringFromDate:date] forKey:@"timestamp"];
    
}

-(void)picDefault
{
    [self setObject:app_key forKey:@"app_key"];
	[self setObject:@"title,pic_url" forKey:@"fields"];
	[self setObject:@"json" forKey:@"format"];
	[self setObject:@"59miao.pictorials.list.get" forKey:@"method"];
	[self setObject:@"1.1" forKey:@"v"];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"YYYY-MM-dd HH:mm:SS"];
	[self setObject:[df stringFromDate:date] forKey:@"timestamp"];

}



@end
