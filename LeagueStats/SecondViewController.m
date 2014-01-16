//
//  SecondViewController.m
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import "SecondViewController.h"

#define kAPIKEY @"?api_key=a0130ad0-84af-4aff-a251-16815d37ad4a"
#define kDOMAIN @"https://prod.api.pvp.net/api/lol/na/"

@interface SecondViewController ()
@property(nonatomic, strong)NSMutableArray * masteriesArray;
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@v1.2/summoner/%@/masteries%@",kDOMAIN,self.sumID,kAPIKEY]];
    
    NSData * temp = [NSData dataWithContentsOfURL:url];
    if(!temp){
        self.masteriesArray = nil;
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"The Summoner name you entered does not exist!\nPlease go back and try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    NSError * error;
    NSMutableDictionary * masteries = [NSJSONSerialization JSONObjectWithData:temp options:NSJSONReadingMutableContainers error:&error];
    NSMutableArray * temparr = [[masteries objectForKey:@"pages"] mutableCopy];
    
    self.masteriesArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [[masteries objectForKey:@"pages"] count]; i++) {
        
        BOOL current = [[[temparr objectAtIndex:i] valueForKey:@"current"] integerValue];
        int mID = [[[temparr objectAtIndex:i] valueForKey:@"id"] integerValue];
        NSString * name = [[temparr objectAtIndex:i] objectForKey:@"name"];
        NSMutableArray * talentsarr = [[temparr objectAtIndex:i] objectForKey:@"talents"];
        NSMutableArray * tempTalentArray = [[NSMutableArray alloc] init];
        for (int k = 0; k < talentsarr.count; k++) {
            int tID = [[[talentsarr objectAtIndex:k] valueForKey:@"id"] integerValue];
            NSString * tname = [[talentsarr objectAtIndex:k] objectForKey:@"name"];
            int rank = [[[talentsarr objectAtIndex:k] valueForKey:@"rank"] integerValue];
            Talents * tempTalent = [[Talents alloc]initWithID:tID Name:tname AndRank:rank];
            [tempTalentArray insertObject:tempTalent atIndex:k];
        }
        
        
        Masteries * temp = [[Masteries alloc]initWithCurrent:current ID:mID Name:name AndWithTalents:tempTalentArray];
        [self.masteriesArray insertObject:temp atIndex:i];
    }
self.collectionView.contentInset = UIEdgeInsetsMake(20, 0, 20, 0);
}

#pragma mark Collection View Code

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    Masteries * temp = [self.masteriesArray objectAtIndex:section];
    NSMutableArray * talentArray = temp.talents.mutableCopy;
    
    return talentArray.count;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CVHeaderView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    Masteries * master = [self.masteriesArray objectAtIndex:indexPath.section];
    view.titleLbl.text = master.name;
    return view;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.masteriesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Masteries * tempMaster = [self.masteriesArray objectAtIndex:indexPath.section];
    Talents * tempTalent = tempMaster.talents[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",tempTalent.name]];
    cell.nameLabel.text = tempTalent.name;
    cell.rankLabel.text = [NSString stringWithFormat:@"Rank: %i",tempTalent.rank];
    return cell;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
