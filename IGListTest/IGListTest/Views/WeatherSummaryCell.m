//
//  WeatherSummaryCell.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "WeatherSummaryCell.h"
#import "Utils.h"

@interface WeatherSummaryCell ()



@end

@implementation WeatherSummaryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.expandLabel];
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = ssRGBHex(0x0c1f3f);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(CommonInsets.left, 0, self.titleLabel.bounds.size.width, self.bounds.size.height);
    self.expandLabel.center = CGPointMake(self.bounds.size.width - self.expandLabel.bounds.size.width / 2 - CommonInsets.right, self.bounds.size.height / 2);
    
}

- (void)setExpanded:(BOOL)expanded {
    self.expandLabel.transform = expanded ? CGAffineTransformMakeRotation(M_PI / 2) : CGAffineTransformIdentity;
}

- (UILabel *)expandLabel {
    if (!_expandLabel) {
        _expandLabel = [[UILabel alloc] init];
        _expandLabel.font = AppFont(30);
        _expandLabel.text = @">>";
        _expandLabel.textColor = ssRGBHex(0x44758b);
        _expandLabel.textAlignment = NSTextAlignmentCenter;
        _expandLabel.backgroundColor = [UIColor clearColor];
        [_expandLabel sizeToFit];
    }
    return _expandLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.numberOfLines = 0;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.paragraphSpacing = 4;
        NSDictionary *subtitleAttributes = @{
            NSFontAttributeName: AppFont(14),
            NSForegroundColorAttributeName: ssRGBHex(0x42c84b),
            NSParagraphStyleAttributeName: paragraphStyle
        };
        NSDictionary *titleAttributes = @{
            NSFontAttributeName: AppFont(24),
            NSForegroundColorAttributeName: [UIColor whiteColor]
        };
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@"LATEST\n" attributes:subtitleAttributes];
        [attributedText appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"WEATHER" attributes:titleAttributes]];
        _titleLabel.attributedText = attributedText;
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

@end
