//
//  JournalSectionController.h
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import <IGListKit/IGListKit.h>


NS_ASSUME_NONNULL_BEGIN

@class JournalEntry;
@class SolFormatter;

@interface JournalSectionController : IGListSectionController

@property (nonatomic, strong) JournalEntry *entry;

@property (nonatomic, strong) SolFormatter *solFormatter;

@end

NS_ASSUME_NONNULL_END
