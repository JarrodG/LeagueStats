//
//  Masteries.m
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import "Masteries.h"

@implementation Masteries
-(Masteries*)initWithCurrent:(BOOL)c ID:(int)i Name:(NSString *)n AndWithTalents:(NSArray *)t{
    self = [super init];
    if (self) {
        self.current = c;
        self.mID = i;
        self.name = n;
        self.talents = t;
    }
    return self;
}
@end
