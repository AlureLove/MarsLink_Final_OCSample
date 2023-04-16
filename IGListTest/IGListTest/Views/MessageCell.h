//
//  MessageCell.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *statusLabel;

+ (CGSize)cellSizeWithWidth:(CGFloat)width text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
