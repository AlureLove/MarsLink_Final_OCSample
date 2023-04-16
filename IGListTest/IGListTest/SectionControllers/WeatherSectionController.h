//
//  WeatherSectionController.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Weather;

@interface WeatherSectionController : IGListSectionController

@property (nonatomic, strong) Weather *weather;

@property (nonatomic, assign) BOOL expanded;

@end

NS_ASSUME_NONNULL_END
