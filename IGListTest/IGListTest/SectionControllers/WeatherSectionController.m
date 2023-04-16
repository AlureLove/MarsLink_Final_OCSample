//
//  WeatherSectionController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "WeatherSectionController.h"
#import "MarslinkModel.h"
#import "WeatherDetailCell.h"
#import "WeatherSummaryCell.h"

@implementation WeatherSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.expanded ? 5 : 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        return CGSizeMake(self.collectionContext.containerSize.width, 70);
    } else {
        return CGSizeMake(self.collectionContext.containerSize.width, 40);
    }
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        WeatherSummaryCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WeatherSummaryCell class] forSectionController:self atIndex:index];
        [cell setExpanded:self.expanded];
        return cell;
    } else {
        WeatherDetailCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WeatherDetailCell class] forSectionController:self atIndex:index];
        NSString *title, *detail;
        switch (index) {
            case 1:
                title = @"SUNRISE";
                detail = self.weather.sunrise;
                break;
            case 2:
                title = @"SUNSET";
                detail = self.weather.sunset;
                break;
            case 3:
                title = @"HIGH";
                detail = [NSString stringWithFormat:@"%ld C", (long)self.weather.high];
                break;
            case 4:
                title = @"LOW";
                detail = [NSString stringWithFormat:@"%ld C", (long)self.weather.low];
                break;
            default:
                title = @"n/a";
                detail = @"n/a";
                break;
        }
        cell.titleLabel.text = title;
        cell.detailLabel.text = detail;
        return cell;
    }
}

- (void)didUpdateToObject:(id)object {
    self.weather = (Weather *)object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    self.expanded = !self.expanded;
    [self.collectionContext invalidateLayoutForSectionController:self completion:nil];
}

@end
