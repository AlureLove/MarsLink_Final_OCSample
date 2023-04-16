//
//  FeedViewController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/16.
//

#import "FeedViewController.h"
#import <IGListKit/IGListKit.h>
#import "JournalEntryLoader.h"
#import "Pathfinder.h"
#import "MarslinkModel.h"
#import "MessageSectionController.h"
#import "WeatherSectionController.h"
#import "JournalSectionController.h"

@interface FeedViewController () <IGListAdapterDataSource, PathfinderDelegate>

@property (nonatomic, strong) JournalEntryLoader *loader;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) Pathfinder *pathfinder;

@property (nonatomic, strong) Weather *currentWeather;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.loader loadLatest];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.pathfinder.delegate = self;
    [self.pathfinder connect];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:self.currentWeather];
    [items addObjectsFromArray:self.loader.entries];
    [items addObjectsFromArray:self.pathfinder.messages];
    
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[Weather class]] || [obj isKindOfClass:[JournalEntry class]] || [obj isKindOfClass:[Message class]]) {
            
        }
    }];
    
    return items;
    
//    [items sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//
//    }];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[Message class]]) {
        return [[MessageSectionController alloc] init];
    } else if ([object isKindOfClass:[Weather class]]) {
        return [[WeatherSectionController alloc] init];
    } else {
        return [[JournalSectionController alloc] init];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)pathfinderDidUpdateMessagesWithPathfinder:(Pathfinder *)pathfinder {
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (JournalEntryLoader *)loader {
    if (!_loader) {
        _loader = [[JournalEntryLoader alloc] init];
    }
    return _loader;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (Pathfinder *)pathfinder {
    if (!_pathfinder) {
        _pathfinder = [[Pathfinder alloc] init];
    }
    return _pathfinder;
}

- (Weather *)currentWeather {
    if (!_currentWeather) {
        _currentWeather = [[Weather alloc] initWithTemperature:6 high:13 low:-69 date:[[NSDate alloc] init] sunrise:@"05:42" sunset:@"17:58" condition:WeatherConditionDustStorm];
    }
    return _currentWeather;
}

@end
