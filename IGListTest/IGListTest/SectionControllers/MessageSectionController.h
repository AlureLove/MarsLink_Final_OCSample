//
//  MessageSectionController.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Message;

@interface MessageSectionController : IGListSectionController

@property (nonatomic, strong) Message *message;

@end

NS_ASSUME_NONNULL_END
