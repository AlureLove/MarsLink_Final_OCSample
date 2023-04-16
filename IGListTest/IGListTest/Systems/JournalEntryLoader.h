//
//  JournalEntryLoader.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JournalEntry;

@interface JournalEntryLoader : NSObject

@property (nonatomic, strong) NSArray<JournalEntry *> *entries;

- (void)loadLatest;

@end

NS_ASSUME_NONNULL_END
