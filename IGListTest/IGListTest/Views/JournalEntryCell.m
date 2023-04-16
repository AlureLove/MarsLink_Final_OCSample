//
//  JournalEntryCell.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "JournalEntryCell.h"
#import "Utils.h"

#define inset UIEdgeInsetsMake(0, 15, 0, 15)

@interface JournalEntryCell ()



@end

@implementation JournalEntryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = ssRGBHex(0x0c1f3f);
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = UIEdgeInsetsInsetRect(self.bounds, inset);
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width text:(NSString *)text {
    return [Utils sizeWithText:text font:AppFontDefault width:width insets:inset].size;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = AppFontDefault;
        _label.numberOfLines = 0;
        _label.textColor = [UIColor whiteColor];
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

@end
