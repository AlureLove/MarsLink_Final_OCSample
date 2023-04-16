//
//  NSObject+IGListDiffable.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "NSObject+IGListDiffable.h"

@implementation NSObject (IGListDiffable)

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
