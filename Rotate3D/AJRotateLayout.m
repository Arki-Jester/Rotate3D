//
//  AJRotateLayout.m
//  AJ
//
//  Created by A.Jester on 10/04/2018.
//  Copyright © 2018 AJ. All rights reserved.
//

#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define HomePageCellWidth (Screen_Width-60)
#import "AJRotateLayout.h"

@interface AJRotateLayout () {
    CGFloat _viewHeight;
    CGFloat _itemHeight;
}

@end

@implementation AJRotateLayout

- (void)prepareLayout {
    [super prepareLayout];
    _viewHeight = CGRectGetHeight(self.collectionView.frame);
    _itemHeight = self.itemSize.height;
        self.collectionView.contentInset = UIEdgeInsetsMake((_viewHeight - _itemHeight) / 2, 0, (_viewHeight - _itemHeight) / 2, 0);
}

- (CGSize)collectionViewContentSize {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount * _itemHeight);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat centerY = self.collectionView.contentOffset.y;
    NSInteger index = centerY / _itemHeight;
    NSInteger minIndex = MAX(0, (index - 2));
    NSInteger maxIndex = MIN((cellCount - 1), (index + 2));
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
        
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = self.itemSize;
    

    CGFloat cY = self.collectionView.contentOffset.y + _viewHeight / 2;
    CGFloat attributesY = _itemHeight * indexPath.row + _itemHeight / 2;

    attributes.zIndex = -ABS(attributesY - cY);

    CGFloat delta = cY - attributesY;
    CGFloat ratio =  - delta / (_itemHeight * 2);
    
    CGFloat centerY = attributesY;
    
    if(delta<0)
    {
        attributes.frame = CGRectMake(0, HomePageCellWidth*indexPath.row, HomePageCellWidth,HomePageCellWidth);
    }else{
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0/400.0f;
        transform = CATransform3DRotate(transform, ratio * M_PI*1.5, 1, 0, 0);
        attributes.transform3D = transform;
        attributes.alpha = 1-ABS(ratio*M_PI)*0.85;
    }

    attributes.center = CGPointMake(CGRectGetWidth(self.collectionView.frame) / 2, centerY);

    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    
    CGFloat index = roundf((proposedContentOffset.y + _viewHeight / 2 - _itemHeight / 2) / _itemHeight);
    proposedContentOffset.y = _itemHeight * index + _itemHeight / 2 - _viewHeight / 2 - 64-10;
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end
