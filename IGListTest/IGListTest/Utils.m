//
//  Utils.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "Utils.h"

@implementation Utils

+ (CGRect)sizeWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width insets:(UIEdgeInsets)insets {
    CGSize constrainedSize = CGSizeMake(width - insets.left - insets.right, FLT_MAX);
    NSDictionary *attributs = @{
        NSFontAttributeName: AppFontDefault
    };
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    CGRect bounds = [text boundingRectWithSize:constrainedSize options:options attributes:attributs context:nil];
    bounds.size.width = width;
    bounds.size.height = ceil(bounds.size.height + insets.top + insets.bottom);
    return bounds;
}

@end
