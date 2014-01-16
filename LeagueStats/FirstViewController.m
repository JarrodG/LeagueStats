//
//  FirstViewController.m
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property(nonatomic,strong)NSString * summonerID;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getIDFromName:(id)sender {
    NSString * summonerName = self.nameTextField.text;
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://prod.api.pvp.net/api/lol/na/v1.2/summoner/by-name/%@?api_key=a0130ad0-84af-4aff-a251-16815d37ad4a",summonerName]];
    NSData * temp = [NSData dataWithContentsOfURL:url];
    if(!temp) {
        self.summonerID = @"ERROR";
        return;
    }
    NSError * error;
    
    NSMutableDictionary * summonerInfoDict = [NSJSONSerialization JSONObjectWithData:temp options:NSJSONReadingMutableContainers error:&error];
    
    self.summonerID = [summonerInfoDict valueForKey:@"id"];
    
    NSLog(@"%@",self.summonerID);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue.destinationViewController setSumID:self.summonerID];
}
@end
