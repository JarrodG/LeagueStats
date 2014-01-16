//
//  Talents.m
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import "Talents.h"

@implementation Talents
-(Talents *)initWithID:(int)i Name:(NSString *)n AndRank:(int)r{
    self = [super init];
    if (self) {
        self.tID = i;
        self.name = n;
        self.rank = r;
    }
    return self;
}
@end
