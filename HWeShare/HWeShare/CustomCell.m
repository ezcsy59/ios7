//
//  CustomCell.m
//  taobaoDemo
//
//  Created by mac on 13-12-31.
//
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize title,subtitle,image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
//    [_title release];
//    [_subtitle release];
//    [_image release];
//    [super dealloc];
}
@end
