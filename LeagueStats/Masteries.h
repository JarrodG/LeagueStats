//
//  Masteries.h
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Talents.h"

@interface Masteries : NSObject
@property BOOL current;
@property long mID;
@property(nonatomic, strong)NSString * name;
@property(nonatomic,strong)NSArray * talents;
-(Masteries *)initWithCurrent:(BOOL)c ID:(int)i Name:(NSString *)n AndWithTalents:(NSArray *)t;
@end
