//
//  MarslinkModel.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <Foundation/Foundation.h>
#import "NSObject+IGListDiffable.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WeatherCondition) {
    WeatherConditionCloudy = 0,
    WeatherConditionSunny = 1 << 0,
    WeatherConditionPartlyCloudy = 1 << 1,
    WeatherConditionDustStorm = 1 << 2
};

@interface MarslinkModel : NSObject

@end

@interface User : NSObject

@property (nonatomic, assign) NSInteger idx;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithId:(NSInteger)Id name:(NSString *)name;

@end

@interface JournalEntry : NSObject

@property (nonatomic, copy) NSDate *date;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) User *user;

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(User *)user;

@end

@interface Message : NSObject

@property (nonatomic, copy) NSDate *date;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) User *user;

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(User *)user;

@end

@interface SolFormatter : NSObject

@property (nonatomic, copy) NSDate *landingDate;

- (instancetype)initWithLandingDate:(NSDate *)landingDate;

- (NSInteger)solsFromDate:(NSDate *)date;

@end

@interface Weather : NSObject

@property (nonatomic, assign) NSInteger temperature;

@property (nonatomic, assign) NSInteger high;

@property (nonatomic, assign) NSInteger low;

@property (nonatomic, copy) NSDate *date;

@property (nonatomic, copy) NSString *sunrise;

@property (nonatomic, copy) NSString *sunset;

@property (nonatomic, assign) WeatherCondition condition;

- (instancetype)initWithTemperature:(NSInteger)temperature high:(NSInteger)high low:(NSInteger)low date:(NSDate *)date sunrise:(NSString *)sunrise sunset:(NSString *)sunset condition:(WeatherCondition)condition;

- (NSString *)emojiWithWeatherCondition:(WeatherCondition)condition;

@end

NS_ASSUME_NONNULL_END
