//
//  ClassicFeedViewController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "ClassicFeedViewController.h"
#import "MarslinkModel.h"
#import "JournalEntryLoader.h"
#import "JournalEntryCell.h"
#import "JournalEntryDateCell.h"

@interface ClassicFeedViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) JournalEntryLoader *loader;

@property (nonatomic, strong) SolFormatter *solFormatter;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ClassicFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView registerClass:[JournalEntryCell class] forCellWithReuseIdentifier:NSStringFromClass([JournalEntryCell class])];
    [self.collectionView registerClass:[JournalEntryDateCell class] forCellWithReuseIdentifier:NSStringFromClass([JournalEntryDateCell class])];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self.loader loadLatest];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.loader.entries.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        JournalEntryDateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JournalEntryDateCell class]) forIndexPath:indexPath];
        cell.label.text = [NSString stringWithFormat:@"SOL %ld", (long)[self.solFormatter solsFromDate:[self.loader.entries objectAtIndex:indexPath.item].date]];
        return cell;
    } else {
        JournalEntryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JournalEntryCell class]) forIndexPath:indexPath];
        cell.label.text = [self.loader.entries objectAtIndex:indexPath.item].text;
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        return CGSizeMake(collectionView.bounds.size.width, 30);
    } else {
        return [JournalEntryCell cellSizeWithWidth:collectionView.bounds.size.width text:[self.loader.entries objectAtIndex:indexPath.section].text];
    }
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 15, 0);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.alwaysBounceHorizontal = YES;
    }
    return _collectionView;
}

- (JournalEntryLoader *)loader {
    if (!_loader) {
        _loader = [[JournalEntryLoader alloc] init];
    }
    return _loader;
}

- (SolFormatter *)solFormatter {
    if (!_solFormatter) {
        _solFormatter = [[SolFormatter alloc] init];
    }
    return _solFormatter;
}

@end
