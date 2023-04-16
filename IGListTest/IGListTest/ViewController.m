//
//  ViewController.m
//  IGListTest
//
//  Created by liuruixuan on 2023/4/15.
//

#import "ViewController.h"
#import <IGListKit/IGListKit.h>
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:1];
        _adapter.collectionView = self.collectionView;
//        _adapter.dataSource = 
    }
    return _adapter;
}

@end
