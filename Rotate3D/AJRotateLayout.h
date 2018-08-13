//
//  AJRotateLayout.h
//  AJ
//
//  Created by A.Jester on 10/04/2018.
//  Copyright © 2018 AJ. All rights reserved.
//


#import <UIKit/UIKit.h>
@class AJRotateLayout;

@protocol AJRotateLayoutDelegate <NSObject>
- (CGFloat)AJRotateLayout:(AJRotateLayout *)flowLayout atIndexPath:(NSIndexPath *)indexPath;
@end

@interface AJRotateLayout : UICollectionViewLayout

@property (nonatomic) CGSize itemSize;
@property (nonatomic, weak) id<AJRotateLayoutDelegate> delegate;

@end
