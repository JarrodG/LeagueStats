//
//  Talents.h
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Talents : NSObject
@property int tID;
@property(nonatomic,strong)NSString * name;
@property int rank;
-(Talents *)initWithID:(int)i Name:(NSString *)n AndRank:(int)r;
@end
