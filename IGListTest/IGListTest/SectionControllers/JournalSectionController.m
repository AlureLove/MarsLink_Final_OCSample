//
//  JournalSectionController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "JournalSectionController.h"
#import "JournalEntryCell.h"
#import "MarslinkModel.h"
#import "JournalEntryDateCell.h"

@interface JournalSectionController ()

@end

@implementation JournalSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 15, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 2;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        return CGSizeMake(self.collectionContext.containerSize.width, 30);
    } else {
        return [JournalEntryCell cellSizeWithWidth:self.collectionContext.containerSize.width text:self.entry.text];
    }
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    
    if (index == 0) {
        JournalEntryDateCell *cell = [self.collectionContext dequeueReusableCellOfClass:[JournalEntryDateCell class] forSectionController:self atIndex:index];
        cell.label.text = [NSString stringWithFormat:@"SOL %ld", (long)[self.solFormatter solsFromDate:self.entry.date]];
        return cell;
    } else {
        JournalEntryCell *cell = [self.collectionContext dequeueReusableCellOfClass:[JournalEntryCell class] forSectionController:self atIndex:index];
        cell.label.text = self.entry.text;
        return cell;
    }
    
}

- (void)didUpdateToObject:(id)object {
    self.entry = (JournalEntry *)object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

- (SolFormatter *)solFormatter {
    if (!_solFormatter) {
        _solFormatter = [[SolFormatter alloc] init];
    }
    return _solFormatter;
}

@end
