//
//  DemoViewController.m
//  Rotate3D
//
//  Created by A.Jester on 2018/8/13.
//  Copyright © 2018 AJ. All rights reserved.
//

#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define HomePageCellWidth (Screen_Width-60)
#define TEST_COLOR [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#import "DemoViewController.h"
#import "AJRotateLayout.h"
#import "CreativeCell.h"
@interface DemoViewController ()<AJRotateLayoutDelegate>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor redColor];
    UINib *nib=[UINib nibWithNibName:@"CreativeCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CreativeCell"];
    
    
    AJRotateLayout *layout = [[AJRotateLayout alloc] init];
    layout.itemSize = CGSizeMake(HomePageCellWidth, HomePageCellWidth);
    layout.delegate =self;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.clipsToBounds = NO;
    

}
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CreativeCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CreativeCell" forIndexPath:indexPath];
    cell.backgroundColor = TEST_COLOR;
    cell.layer.anchorPoint = CGPointMake(0.5, 1.0);
    return cell;
}

- (CGFloat)AJRotateLayout:(AJRotateLayout *)flowLayout atIndexPath:(NSIndexPath *)indexPath
{
    return HomePageCellWidth;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
