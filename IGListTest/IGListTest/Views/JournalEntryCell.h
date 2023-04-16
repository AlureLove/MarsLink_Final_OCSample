//
//  JournalEntryCell.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JournalEntryCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *label;

+ (CGSize)cellSizeWithWidth:(CGFloat)width text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
