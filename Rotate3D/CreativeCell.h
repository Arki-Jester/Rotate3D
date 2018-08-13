//
//  CreativeCell.h
//  ArtDog
//
//  Created by A.Jester on 10/04/2018.
//  Copyright © 2018 Artdog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreativeCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *momentView;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@end
