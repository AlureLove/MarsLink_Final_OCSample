//
//  MessageSectionController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "MessageSectionController.h"
#import "MarslinkModel.h"
#import "MessageCell.h"

@implementation MessageSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return [MessageCell cellSizeWithWidth:self.collectionContext.containerSize.width text:self.message.text];
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    MessageCell *cell = [self.collectionContext dequeueReusableCellOfClass:[MessageCell class] forSectionController:self atIndex:index];
    cell.messageLabel.text = self.message.text;
    cell.titleLabel.text = [self.message.user.name uppercaseString];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.message = (Message *)object;
}

@end
