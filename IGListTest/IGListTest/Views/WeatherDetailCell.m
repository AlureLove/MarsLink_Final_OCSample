//
//  WeatherDetailCell.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "WeatherDetailCell.h"
#import "Utils.h"

@interface WeatherDetailCell ()



@end

@implementation WeatherDetailCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.detailLabel];
        self.contentView.backgroundColor = ssRGBHex(0x0c1f3f);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect insetBounds = UIEdgeInsetsInsetRect(self.bounds, CommonInsets);
    self.titleLabel.frame = insetBounds;
    self.detailLabel.frame = insetBounds;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = AppFontDefault;
        _titleLabel.textColor = ssRGBHex(0x42c84b);
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = AppFontDefault;
        _detailLabel.textColor = ssRGBHex(0x42c84b);
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _detailLabel;
}

@end
