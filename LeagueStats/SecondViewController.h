//
//  SecondViewController.h
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masteries.h"
#import "Cell.h"
#import "CVHeaderView.h"

@interface SecondViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic,strong)NSString * sumID;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
