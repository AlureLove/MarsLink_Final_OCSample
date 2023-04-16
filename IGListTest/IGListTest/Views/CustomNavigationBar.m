//
//  CustomNavigationBar.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "CustomNavigationBar.h"
#import "Utils.h"

@interface CustomNavigationBar ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) CAShapeLayer *statusIndicator;

@property (nonatomic, strong) CAShapeLayer *highlightLayer;

@property (nonatomic, assign) BOOL statusOn;

@end

@implementation CustomNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.highlightLayer];
        [self.layer addSublayer:self.statusIndicator];
        [self addSubview:self.titleLabel];
        [self addSubview:self.statusLabel];
        self.barTintColor = [UIColor blackColor];
        self.statusOn = NO;
        [self updateStatus];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat titleWidth = 130;
    CGFloat borderHeight = 4;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(titleWidth, 0)];
    [path addLineToPoint:CGPointMake(titleWidth, self.bounds.size.height - borderHeight)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - borderHeight)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    self.highlightLayer.path = path.CGPath;
    
    self.titleLabel.frame = CGRectMake(0, 0, titleWidth, self.bounds.size.height);
    self.statusLabel.frame = CGRectMake(self.bounds.size.width - self.statusLabel.bounds.size.width - CommonInsets.right, self.bounds.size.height - borderHeight - self.statusLabel.bounds.size.height - 6, self.statusLabel.bounds.size.width, self.statusLabel.bounds.size.height);
    self.statusIndicator.position = CGPointMake(self.statusLabel.center.x - 50, self.statusLabel.center.y - 1);
}

- (void)updateStatus {
    self.statusOn = !self.statusOn;
    [CATransaction begin];
    [CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    self.statusIndicator.fillColor = self.statusOn ? [UIColor whiteColor].CGColor : [UIColor blackColor].CGColor;
    [CATransaction commit];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DISPATCH_TIME_NOW + 0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self updateStatus];
    });
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"OCRAStd" size:18];
        _titleLabel.text = @"MARSLINK";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.font = [UIFont fontWithName:@"OCRAStd" size:13];
        _statusLabel.text = @"RECEIVING";
        _statusLabel.textColor = ssRGBHex(0x42c84b);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.backgroundColor = [UIColor clearColor];
        [_statusLabel sizeToFit];
    }
    return _statusLabel;
}

- (CAShapeLayer *)statusIndicator {
    if (!_statusIndicator) {
        _statusIndicator = [[CAShapeLayer alloc] init];
        _statusIndicator.strokeColor = [UIColor whiteColor].CGColor;
        _statusIndicator.lineWidth = 1;
        _statusIndicator.fillColor = [UIColor blackColor].CGColor;
        _statusIndicator.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 8, 8) cornerRadius:4].CGPath;
        _statusIndicator.frame = CGRectMake(0, 0, 8, 8);
    }
    return _statusIndicator;
}

- (CAShapeLayer *)highlightLayer {
    if (!_highlightLayer) {
        _highlightLayer = [[CAShapeLayer alloc] init];
        _highlightLayer.fillColor = ssRGBHex(0x76879D).CGColor;
    }
    return _highlightLayer;
}

@end
