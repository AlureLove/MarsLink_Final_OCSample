//
//  MessageCell.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "MessageCell.h"
#import "Utils.h"

#define titleHeight 30

@interface MessageCell ()



@end

@implementation MessageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = ssRGBHex(0x0c1f3f);
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.statusLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(CommonInsets.left, 0, self.bounds.size.width - CommonInsets.left - CommonInsets.right, titleHeight);
    self.statusLabel.frame = CGRectMake(self.bounds.size.width - 80, 4, 70, 18);
    CGRect messageFrame = CGRectMake(0, self.titleLabel.frame.origin.y, self.bounds.size.width, self.bounds.size.height - titleHeight);
    self.messageLabel.frame = UIEdgeInsetsInsetRect(messageFrame, CommonInsets);
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width text:(NSString *)text {
    CGRect labelBounds = [Utils sizeWithText:text font:AppFontDefault width:width insets:CommonInsets];
    return CGSizeMake(width, labelBounds.size.height + titleHeight);
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = AppFontDefault;
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = AppFont(14);
        _titleLabel.textColor = ssRGBHex(0x42c84b);
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.layer.borderColor = ssRGBHex(0x76879d).CGColor;
        _statusLabel.layer.borderWidth = 1;
        _statusLabel.font = AppFont(8);
        _statusLabel.text = @"NEW MESSAGE";
        _statusLabel.textColor = ssRGBHex(0x76879d);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.backgroundColor = [UIColor clearColor];
    }
    return _statusLabel;
}

@end
