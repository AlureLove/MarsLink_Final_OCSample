//
//  Pathfinder.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Pathfinder;
@class Message;

@protocol PathfinderDelegate <NSObject>

- (void)pathfinderDidUpdateMessagesWithPathfinder:(Pathfinder *)pathfinder;

@end

@interface Pathfinder : NSObject

@property (nonatomic, weak) id<PathfinderDelegate> delegate;

@property (nonatomic, strong) NSMutableArray<Message *> *messages;

- (void)connect;

@end

NS_ASSUME_NONNULL_END
