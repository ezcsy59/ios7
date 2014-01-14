//
//  CustomCell.h
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *title;
@property (retain, nonatomic) IBOutlet UILabel *subtitle;
@property (retain, nonatomic) IBOutlet UILabel *price;
@property (retain, nonatomic) IBOutlet UIImageView *image;


@property (retain, nonatomic) NSString *name;

@property (retain, nonatomic) NSString *subname;

@end
