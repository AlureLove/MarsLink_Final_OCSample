//
//  Pathfinder.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "Pathfinder.h"
#import "MarslinkModel.h"

@implementation Pathfinder

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(messages)) options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"messages"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pathfinderDidUpdateMessagesWithPathfinder:)]) {
            [self.delegate pathfinderDidUpdateMessagesWithPathfinder:self];
        }
    }
}

- (void)connect {
    NSMutableArray *tempArray = [self mutableArrayValueForKey:NSStringFromSelector(@selector(messages))];
    [self delayWithTime:2.3 excute:^{
        [tempArray addObject:[self lewisMessageWithText:@"Liftoff in 3..." interval:0]];
        [self delayWithTime:1 excute:^{
            [tempArray addObject:[self lewisMessageWithText:@"2..." interval:0]];
            [self delayWithTime:1 excute:^{
                [tempArray addObject:[self lewisMessageWithText:@"1..." interval:0]];
            }];
        }];
    }];
}

- (void)delayWithTime:(double)time excute:(void(^)(void))work {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DISPATCH_TIME_NOW + time) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        work();
    });
}

- (Message *)lewisMessageWithText:(NSString *)text interval:(NSTimeInterval)interval {
    User *user = [[User alloc] initWithId:2 name:@"cpt.lewis"];
    return [[Message alloc] initWithDate:[NSDate dateWithTimeIntervalSinceNow:interval] text:text user:user];
}

- (NSMutableArray<Message *> *)messages {
    if (!_messages) {
        _messages = [NSMutableArray array];
        NSMutableArray *tempArray = [self mutableArrayValueForKey:NSStringFromSelector(@selector(messages))];
        [tempArray addObject:[self lewisMessageWithText:@"Mark, are you receiving me?" interval:-803200]];
        [tempArray addObject:[self lewisMessageWithText:@"I think I left behind some ABBA, might help with the drive 😜" interval:-259200]];
    }
    return _messages;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"messages"];
}

@end
