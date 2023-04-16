//
//  Utils.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ssRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define AppFontDefault [UIFont fontWithName:@"OCRAStd" size:18]

#define AppFont(value) [UIFont fontWithName:@"OCRAStd" size:(value)]

#define CommonInsets UIEdgeInsetsMake(8, 15, 8, 15)

@interface Utils : NSObject

+ (CGRect)sizeWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width insets:(UIEdgeInsets)insets;

@end

NS_ASSUME_NONNULL_END
