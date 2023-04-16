//
//  JournalEntryDateCell.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "JournalEntryDateCell.h"
#import "Utils.h"

@interface JournalEntryDateCell ()

@end

@implementation JournalEntryDateCell

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
    self.label.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, CommonInsets.left, 0, CommonInsets.right));
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = AppFont(14);
        _label.textColor = ssRGBHex(0x42c84b);
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

@end
