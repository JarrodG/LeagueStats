//
//  FirstViewController.h
//  LeagueStats
//
//  Created by Jarrod Glissmann on 1/15/14.
//  Copyright (c) 2014 Jarrod Glissmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController
- (IBAction)getIDFromName:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
