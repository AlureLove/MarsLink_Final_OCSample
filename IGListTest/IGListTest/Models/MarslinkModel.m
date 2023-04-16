//
//  MarslinkModel.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "MarslinkModel.h"

@implementation MarslinkModel

@end

@implementation User

- (instancetype)initWithId:(NSInteger)Id name:(NSString *)name
{
    self = [super init];
    if (self) {
        self.idx = Id;
        self.name = name;
    }
    return self;
}

@end

@implementation JournalEntry

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(User *)user
{
    self = [super init];
    if (self) {
        self.date = date;
        self.text = text;
        self.user = user;
    }
    return self;
}

@end

@implementation Message

- (instancetype)initWithDate:(NSDate *)date text:(NSString *)text user:(User *)user {
    self = [super init];
    if (self) {
        self.date = date;
        self.text = text;
        self.user = user;
    }
    return self;
}

@end

@implementation SolFormatter

- (instancetype)initWithLandingDate:(NSDate *)landingDate
{
    self = [super init];
    if (self) {
        self.landingDate = landingDate;
    }
    return self;
}

- (NSInteger)solsFromDate:(NSDate *)date {
    NSTimeInterval martianDay = 1477 * 60;
    NSTimeInterval seconds = [date timeIntervalSinceDate:self.landingDate];
    return lround(seconds / martianDay);
}

@end

@implementation Weather

- (instancetype)initWithTemperature:(NSInteger)temperature high:(NSInteger)high low:(NSInteger)low date:(NSDate *)date sunrise:(NSString *)sunrise sunset:(NSString *)sunset condition:(WeatherCondition)condition
{
    self = [super init];
    if (self) {
        self.temperature = temperature;
        self.high = high;
        self.low = low;
        self.date = date;
        self.sunrise = sunrise;
        self.sunset = sunset;
        self.condition = condition;
    }
    return self;
}

- (NSString *)emojiWithWeatherCondition:(WeatherCondition)condition {
    switch (condition) {
        case WeatherConditionCloudy:
            return @"☁️";
            break;
        case WeatherConditionSunny:
            return @"☀️";
            break;
        case WeatherConditionPartlyCloudy:
            return @"⛅️";
            break;
        case WeatherConditionDustStorm:
            return @"🌪";
            break;
        default:
            break;
    }
    return @"";
}

@end
