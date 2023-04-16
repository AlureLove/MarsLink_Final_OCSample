//
//  WeatherSummaryCell.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherSummaryCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *expandLabel;

@property (nonatomic, strong) UILabel *titleLabel;

- (void)setExpanded:(BOOL)expanded;

@end

NS_ASSUME_NONNULL_END
